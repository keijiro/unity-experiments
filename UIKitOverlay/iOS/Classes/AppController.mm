#import "AppController.h"
#include <mach/mach_time.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Availability.h>

#import <OpenGLES/EAGL.h>
#import <OpenGLES/EAGLDrawable.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <OpenGLES/ES2/glext.h>
// USE_DISPLAY_LINK_IF_AVAILABLE
//
// NOTE: some developers reported problems with input lag while using CADisplayLink, therefore it is disabled by default.
// Try enabling it, testing on 3.1 or later OS - if you observe no input lag, then use it.
//
// Use of the CADisplayLink class is the preferred method for controlling your rendering loop.
// CADisplayLink will link to the main display and fire every vsync when added to a given run-loop.
// Other main loop types (NSTimer, Thread, EventPump) are used only as fallback when running
// on a pre 3.1 device where CADisplayLink is not available.
//
// Note that OS version and CADisplayLink support will be determined at the run-time automatically and 
// you CAN compile your application using ANY SDK. Your application will work succesfully on pre 3.1 device too.
//
// Constants supported by this method: kFPS


// Fallback types (for pre 3.1 devices):

// NSTIMER_BASED_LOOP
//
// It is a common approach to use NSTimer for scheduling rendering on a pre 3.1 device
// NSTimer approach is perfect for non-performance critical applications which favours battery life 
// and scrupulous correct events processing over the rendering performance.
//
// Constants supported by this method: kThrottleFPS, kFPS


// THREAD_BASED_LOOP
//
// However number of games might prefer frame-rate over battery life,
// therefore Unity provide alternate methods which allows you to run in a tighter rendering loop.

// Thread based loop allows to get best of two worlds - fast rendering and guaranteed event processing.
//
// Constants supported by this method: kFPS


// EVENT_PUMP_BASED_LOOP
//
// Following method allows you to specify explicit time limit for OS to process events.
// Though it might lend you best rendering performance some input events maybe missing,
// therefore you must carefully tweak kMillisecondsPerFrameToProcessEvents to achieve desired responsivness.
//
// Constants supported by this method: kMillisecondsPerFrameToProcessEvents, kFPS


// Constants:
// 
// kFPS - allows you to set desired framerate in frames per second. Set to 30 by default.
// Normally game will not run faster than specified by kFPS. Note that iPhone device can not render faster than 60 frames per second.

// kThrottleFPS - usually you need to boost NSTimer approach a bit to get any decent performance. Set to 2 by default.
// Meaningful only if NSTIMER_BASED_LOOP method is used.

// kMillisecondsPerFrameToProcessEvents - allows you to specify how much time you allow to process events if OS event pump method is used. Set to 3ms by default.
// Settings kMillisecondsPerFrameToProcessEvents to 0 will make main loop to wait for OS to pump all events.
// Meaningful only if EVENT_PUMP_BASED_LOOP method is used.

#define USE_OPENGLES20_IF_AVAILABLE 1
#define USE_DISPLAY_LINK_IF_AVAILABLE 0
#define MSAA_DEFAULT_SAMPLE_COUNT 0

//#define FALLBACK_LOOP_TYPE NSTIMER_BASED_LOOP
#define FALLBACK_LOOP_TYPE THREAD_BASED_LOOP
//#define FALLBACK_LOOP_TYPE EVENT_PUMP_BASED_LOOP

#define ENABLE_INTERNAL_PROFILER 0
#define ENABLE_BLOCK_ON_GPU_PROFILER 0
#define BLOCK_ON_GPU_EACH_NTH_FRAME 4
#define INCLUDE_OPENGLES_IN_RENDER_TIME 0

// --- CONSTANTS ----------------------------------------------------------------
//

#if FALLBACK_LOOP_TYPE == NSTIMER_BASED_LOOP
#define kThrottleFPS							2.0
#endif

#if FALLBACK_LOOP_TYPE == EVENT_PUMP_BASED_LOOP
#define kMillisecondsPerFrameToProcessEvents	3
#endif

#define kFPS									30.0
#define kAccelerometerFrequency					60.0


// --- Unity --------------------------------------------------------------------
//

static void CheckGLESError (const char* fn, int line)
{
	GLenum e = glGetError();
	if (e)
	{
		printf_console ("OpenGLES error 0x%04X in %s:%i\n", e, fn, line);
	}
}
#define CALL_EAGL_FUNCTION(__FUNC__, ...) ({ EAGLError __error = __FUNC__( __VA_ARGS__ ); if(__error != kEAGLErrorSuccess) printf("%s() called from %s returned error %i\n", #__FUNC__, __FUNCTION__, __error); (__error ? 0 : 1); })
#define CHECK_GL_ERROR() CheckGLESError (__FUNCTION__, __LINE__)
#define EAGL_ERROR(action) ({ printf_console("Failed to %s. Called from %s\n", action, __FUNCTION__);})


void UnityPlayerLoop();
void UnityFinishRendering();
void UnityInitApplication(const char* appPathName);
void UnityPause(bool pause);
void UnityReloadResources();
void UnitySetAudioSessionActive(bool active);
void UnityCleanup();

void UnitySendTouchesBegin(NSSet* touches, UIEvent* event);
void UnitySendTouchesEnded(NSSet* touches, UIEvent* event);
void UnitySendTouchesCancelled(NSSet* touches, UIEvent* event);
void UnitySendTouchesMoved(NSSet* touches, UIEvent* event);
void UnityDidAccelerate(float x, float y, float z, NSTimeInterval timestamp);
void UnityInputProcess();
bool UnityIsRenderingAPISupported(int renderingApi);
bool UnityHasRenderingAPIExtension(const char *extension);
void UnitySetInputScaleFactor(float scale);
float UnityGetInputScaleFactor();
int UnityGetDesiredMSAASampleCount(int defaultSampleCount);

void*	UnityCreateProfilerCounter( const char* name );
void	UnityDestroyProfilerCounter( void* counter );
void	UnityStartProfilerCounter( void* counter );
void	UnityEndProfilerCounter( void* counter );


enum TargetResolution
{
    kTargetResolutionNative = 0,
    kTargetResolutionStandard = 1,
    kTargetResolutionHD = 2
};

int UnityGetTargetResolution();

enum ScreenOrientation
{
};


class KeyboardOnScreen
{
public:
	static void Init();
};

struct UnityFrameStats
{
	typedef signed long long Timestamp;
	
	Timestamp fixedBehaviourManagerDt;
	Timestamp fixedPhysicsManagerDt;
	Timestamp dynamicBehaviourManagerDt;
	Timestamp coroutineDt;
	Timestamp skinMeshUpdateDt;
	Timestamp animationUpdateDt;
	Timestamp renderDt;
	Timestamp cullingDt;
	Timestamp clearDt;
	int fixedUpdateCount;
	
	// TODO: add msaa resolve in here 
	
	Timestamp drawCallTime;
	int drawCallCount;
	int triCount;
	int vertCount;
	
	Timestamp batchDt;
	int batchedDrawCallCount;
	int batchedTris;
	int batchedVerts;
};

// --- Mono ---------------------------------------------------------------------
//
extern "C" {	
	long mono_gc_get_used_size();
	long mono_gc_get_heap_size();
	
	extern void* GC_notify_event;
	extern void* GC_on_heap_resize;
	
	typedef enum {
		MONO_GC_EVENT_START,
		MONO_GC_EVENT_MARK_START,
		MONO_GC_EVENT_MARK_END,
		MONO_GC_EVENT_RECLAIM_START,
		MONO_GC_EVENT_RECLAIM_END,
		MONO_GC_EVENT_END,
		MONO_GC_EVENT_PRE_STOP_WORLD,
		MONO_GC_EVENT_POST_STOP_WORLD,
		MONO_GC_EVENT_PRE_START_WORLD,
		MONO_GC_EVENT_POST_START_WORLD
	} MonoGCEvent;	
}		

// --- Profiler --------------------------------------------------------------------
//

void*	msaaResolveCounter = 0;

#if ENABLE_INTERNAL_PROFILER
namespace {
	mach_timebase_info_data_t info;
	typedef   signed long long              Prof_Int64;
	
	static float MachToMillisecondsDelta (Prof_Int64 delta)
	{
		// Convert to nanoseconds
		delta *= info.numer;
		delta /= info.denom;
		float result = (float)delta / 1000000.0F;
		return result;
	}
	
	void ProfilerInit()
	{
		mach_timebase_info(&info);
	}
	
	struct ProfilerBlock
	{
		Prof_Int64 maxV, minV, avgV;
	};
	void ProfilerBlock_Update(struct ProfilerBlock* b, Prof_Int64 d, bool reset, bool avoidZero = false)
	{
		if (reset)
		{
			b->maxV = b->minV = b->avgV = d;
		}
		else
		{		
			b->maxV = (d > b->maxV)? d : b->maxV;
			if (avoidZero && (b->minV == 0 || d == 0))
				b->minV = (d > b->minV)? d : b->minV;
			else
				b->minV = (d < b->minV)? d : b->minV;
			b->avgV += d;
		}
	}
}
#endif

#if ENABLE_INTERNAL_PROFILER
namespace {
	int _frameId = 0;
	struct ProfilerBlock _framePB;
	struct ProfilerBlock _gpuPB;
	struct ProfilerBlock _swapPB;
	struct ProfilerBlock _playerPB;
	struct ProfilerBlock _oglesPB;
	
	struct ProfilerBlock _drawCallCountPB;
	struct ProfilerBlock _triCountPB;
	struct ProfilerBlock _vertCountPB;
	
	struct ProfilerBlock _batchPB;
	struct ProfilerBlock _batchedDrawCallCountPB;
	struct ProfilerBlock _batchedTriCountPB;
	struct ProfilerBlock _batchedVertCountPB;
	
	struct ProfilerBlock _fixedBehaviourManagerPB;
	struct ProfilerBlock _fixedPhysicsManagerPB;
	struct ProfilerBlock _dynamicBehaviourManagerPB;
	struct ProfilerBlock _coroutinePB;
	struct ProfilerBlock _skinMeshUpdatePB;
	struct ProfilerBlock _animationUpdatePB;
	struct ProfilerBlock _unityRenderLoopPB;
	struct ProfilerBlock _unityCullingPB;
	struct ProfilerBlock _unityWaitsForGpuPB;
	struct ProfilerBlock _unityMSAAResolvePB;
	struct ProfilerBlock _fixedUpdateCountPB;
	struct ProfilerBlock _GCCountPB;
	struct ProfilerBlock _GCDurationPB;
	
	Prof_Int64 _swapDelta = 0;
	Prof_Int64 _gpuDelta = 0;

	Prof_Int64 _msaaResolve = 0;
	
	Prof_Int64 _frameDelta = 0;
	Prof_Int64 _lastVBlankTime = -1;
	
	struct UnityFrameStats _unityFrameStats;
	
	Prof_Int64 gcstarted = 0;
	
	void gccallback(int event)
	{
		if (event == MONO_GC_EVENT_START)
			gcstarted = mach_absolute_time();
		
		if (event == MONO_GC_EVENT_END)
		{
			float delta = mach_absolute_time() - gcstarted;
			ProfilerBlock_Update(&_GCDurationPB, delta, false);
			ProfilerBlock_Update(&_GCCountPB, 1, false);
		}
	}
	
}
#endif

/*
#include <mach/mach.h>
#include <mach/mach_host.h>

static void print_mem_stats()
{
	mach_port_t host_port;
	mach_msg_type_number_t host_size;
	vm_size_t pagesize;
	
	host_port = mach_host_self();
	host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
	host_page_size(host_port, &pagesize);        
	
	vm_statistics_data_t vm_stat;
	
	if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS)
		printf_console("Failed to fetch vm statistics\n");
	
	// Stats in bytes
	natural_t mem_used = (vm_stat.active_count +
						  vm_stat.inactive_count +
						  vm_stat.wire_count) * pagesize;
	natural_t mem_free = vm_stat.free_count * pagesize;
	natural_t mem_total = mem_used + mem_free;
	printf_console("MEMORY STATS ::::::: used: %u free: %u total: %u\n", mem_used, mem_free, mem_total);
}
*/


// --- OpenGLES --------------------------------------------------------------------
//

#if 1
#define UNITY_DBG_LOG(...) {}
#else
#define UNITY_DBG_LOG(...) {printf_console(__VA_ARGS__);}
#endif


//extern GLint gDefaultGLES2FBO;
extern GLint gDefaultFBO;


// Forward declaration of CADisplayLink for pre-3.1 SDKS
@interface NSObject(CADisplayLink)
+ (id) displayLinkWithTarget:(id)arg1 selector:(SEL)arg2;
- (void) addToRunLoop:(id)arg1 forMode:(id)arg2;
- (void) setFrameInterval:(int)interval;
- (void) invalidate;
@end

struct MyEAGLSurface
{
	GLuint		format;
	GLuint		depthFormat;
	GLuint		framebuffer;
	GLuint		renderbuffer;
	GLuint		depthbuffer;
	
	GLuint		msaaSamples;
	GLuint		msaaFramebuffer;
	GLuint		msaaRenderbuffer;
	GLuint		msaaDepthbuffer;
	
	CGSize		size; 
};

typedef EAGLContext*	MyEAGLContext;

@interface EAGLView : UIView {}
@end

MyEAGLContext			_context;
MyEAGLSurface			_surface;
UIWindow *				_window;
NSTimer*				_timer;
id						_displayLink;
BOOL					_accelerometerIsActive = NO;
// This is set to true when applicationWillResignActive gets called. It is here
// to prevent calling SetPause(false) from applicationDidBecomeActive without
// previous call to applicationWillResignActive
BOOL					_didResignActive = NO;
BOOL					_supportsDiscard = NO;
BOOL					_supportsMSAA = NO;

void CreateSurfaceMultisampleBuffers(MyEAGLSurface* surface);
void DestroySurfaceMultisampleBuffers(MyEAGLSurface* surface);

bool CreateWindowSurface(EAGLView *view, GLuint format, GLuint depthFormat, GLuint msaaSamples, bool retained, MyEAGLSurface* surface)
{
	CGSize newSize;
	GLuint oldRenderbuffer;
	GLuint oldFramebuffer;

    CAEAGLLayer* eaglLayer = (CAEAGLLayer*)[view layer];
	
	surface->format = format;
	surface->depthFormat = depthFormat;
	
	surface->depthbuffer = 0;
	surface->renderbuffer = 0;
	surface->framebuffer = 0;
	
	surface->msaaFramebuffer = 0;
	surface->msaaRenderbuffer = 0;
	surface->msaaDepthbuffer = 0;
	surface->msaaSamples = msaaSamples;
	
	eaglLayer.opaque = YES;
	eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
									[NSNumber numberWithBool:FALSE], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGB565, kEAGLDrawablePropertyColorFormat, nil];
	
	newSize = [eaglLayer bounds].size;
	newSize.width = roundf(newSize.width);
	newSize.height = roundf(newSize.height);

#ifdef __IPHONE_4_0
    int resolution = UnityGetTargetResolution();
    
    if (resolution == kTargetResolutionNative ||
        resolution == kTargetResolutionHD)
    {
        if ([view respondsToSelector:@selector(setContentScaleFactor:)])
        {
            UIScreen* mainScreen = [UIScreen mainScreen];
            CGFloat scaleFactor = mainScreen.scale;
            [view setContentScaleFactor:scaleFactor];
            newSize.width = roundf(newSize.width * scaleFactor);
            newSize.height = roundf(newSize.height * scaleFactor);
            UnitySetInputScaleFactor(scaleFactor);
        }
    }
#endif

	surface->size = newSize;

	UNITY_DBG_LOG ("CreateWindowSurface: create non-AA FBO\n");
	
	glGetIntegerv(GL_RENDERBUFFER_BINDING_OES, (GLint *) &oldRenderbuffer);
	glGetIntegerv(GL_FRAMEBUFFER_BINDING_OES, (GLint *) &oldFramebuffer);
	
	glGenRenderbuffersOES(1, &surface->renderbuffer);
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, surface->renderbuffer);
	
	if(![_context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:eaglLayer]) {
		glDeleteRenderbuffersOES(1, &surface->renderbuffer);
		glBindRenderbufferOES(GL_RENDERBUFFER_BINDING_OES, oldRenderbuffer);
		return false;
	}	
	
	glGenFramebuffersOES(1, &surface->framebuffer);
	UNITY_DBG_LOG ("glBindFramebufferOES(GL_FRAMEBUFFER_OES, %d) :: AppCtrl\n", surface->framebuffer);
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, surface->framebuffer);
	gDefaultFBO = surface->framebuffer;
	UNITY_DBG_LOG ("glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, %d) :: AppCtrl\n", surface->renderbuffer);
	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, surface->renderbuffer);
	
	
#if GL_EXT_discard_framebuffer
	_supportsDiscard = UnityHasRenderingAPIExtension("GL_EXT_discard_framebuffer");
#endif
	
#if GL_APPLE_framebuffer_multisample
	_supportsMSAA = UnityHasRenderingAPIExtension("GL_APPLE_framebuffer_multisample");
#endif
	
	if (!_supportsMSAA)
		surface->msaaSamples = 0;

	CreateSurfaceMultisampleBuffers(surface);
	
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, surface->renderbuffer);
		
	CHECK_GL_ERROR();
	
	return true;
}

void CreateSurfaceMultisampleBuffers(MyEAGLSurface* surface)
{
	UNITY_DBG_LOG ("CreateSurfaceMultisampleBuffers: samples=%i\n", surface->msaaSamples);
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, surface->renderbuffer);
	UNITY_DBG_LOG ("glBindFramebufferOES(GL_FRAMEBUFFER_OES, %d) :: AppCtrl\n", surface->framebuffer);
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, surface->framebuffer);
	gDefaultFBO = surface->framebuffer;

	DestroySurfaceMultisampleBuffers(surface);
	
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, surface->renderbuffer);
	UNITY_DBG_LOG ("glBindFramebufferOES(GL_FRAMEBUFFER_OES, %d) :: AppCtrl\n", surface->framebuffer);
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, surface->framebuffer);
	
#if GL_APPLE_framebuffer_multisample
	if (surface->msaaSamples > 1)
	{
		glGenRenderbuffersOES(1, &surface->msaaRenderbuffer);
		glBindRenderbufferOES(GL_RENDERBUFFER_OES, surface->msaaRenderbuffer);
		
		glGenFramebuffersOES(1, &surface->msaaFramebuffer);
		UNITY_DBG_LOG ("glBindFramebufferOES(GL_FRAMEBUFFER_OES, %d) :: AppCtrl\n", surface->msaaFramebuffer);
		glBindFramebufferOES(GL_FRAMEBUFFER_OES, surface->msaaFramebuffer);
		gDefaultFBO = surface->msaaFramebuffer;
		
		glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER_OES, surface->msaaSamples, surface->format, surface->size.width, surface->size.height);
		glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, surface->msaaRenderbuffer);
		if (surface->depthFormat) {
			glGenRenderbuffersOES(1, &surface->msaaDepthbuffer);
			glBindRenderbufferOES(GL_RENDERBUFFER_OES, surface->msaaDepthbuffer);
			glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER_OES, surface->msaaSamples, GL_DEPTH_COMPONENT16_OES, surface->size.width, surface->size.height);
			glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, surface->msaaDepthbuffer);
		}		
	}
	else
#endif
	{
		if (surface->depthFormat) {
			glGenRenderbuffersOES(1, &surface->depthbuffer);
			glBindRenderbufferOES(GL_RENDERBUFFER_OES, surface->depthbuffer);
			glRenderbufferStorageOES(GL_RENDERBUFFER_OES, surface->depthFormat, surface->size.width, surface->size.height);
			UNITY_DBG_LOG ("glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, %d) :: AppCtrl\n", surface->depthbuffer);
			glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, surface->depthbuffer);
		}
	}
}

void DestroySurface(MyEAGLSurface* surface)
{
	EAGLContext *oldContext = [EAGLContext currentContext];
	
	if (oldContext != _context)
		[EAGLContext setCurrentContext:_context];
	
	glDeleteRenderbuffersOES(1, &surface->renderbuffer);
	surface->renderbuffer = 0;
	
	glDeleteFramebuffersOES(1, &surface->framebuffer);
	surface->framebuffer = 0;
	
	DestroySurfaceMultisampleBuffers(surface);
	
	if (oldContext != _context)
		[EAGLContext setCurrentContext:oldContext];
}

void DestroySurfaceMultisampleBuffers(MyEAGLSurface* surface)
{
	if(surface->depthbuffer)
		glDeleteRenderbuffersOES(1, &surface->depthbuffer);
	surface->depthbuffer = 0;
	
	if(surface->msaaDepthbuffer)
		glDeleteRenderbuffersOES(1, &surface->msaaDepthbuffer);
	surface->msaaDepthbuffer = 0;
	
	if(surface->msaaRenderbuffer)
		glDeleteRenderbuffersOES(1, &surface->msaaRenderbuffer);
	surface->msaaRenderbuffer = 0;
	
	if (surface->msaaFramebuffer)
		glDeleteFramebuffersOES(1, &surface->msaaFramebuffer);	
	surface->msaaFramebuffer = 0;
}


extern "C" bool UnityResolveMSAA (GLuint destFBO, GLuint colorTex, GLuint colorBuf, GLuint depthTex, GLuint depthBuf)
{
	#if GL_APPLE_framebuffer_multisample
	if (_surface.msaaSamples > 0 && _supportsMSAA && destFBO!=_surface.msaaFramebuffer && destFBO!=_surface.framebuffer)
	{
		UnityStartProfilerCounter(msaaResolveCounter);
		#if ENABLE_INTERNAL_PROFILER
		Prof_Int64 msaaTime0 = mach_absolute_time();
		#endif
		
		GLint oldFBO;
		glGetIntegerv (GL_FRAMEBUFFER_BINDING_OES, &oldFBO);
		
		UNITY_DBG_LOG ("UnityResolveMSAA: samples=%i msaaFBO=%i destFBO=%i colorTex=%i colorRB=%i depthTex=%i depthRB=%i\n", _surface.msaaSamples, _surface.msaaFramebuffer, destFBO, colorTex, colorBuf, depthTex, depthBuf);
		UNITY_DBG_LOG ("  bind dest as DRAW FBO and textures/buffers into it\n");
		glBindFramebufferOES (GL_DRAW_FRAMEBUFFER_APPLE, destFBO);			
		if (colorTex)
			glFramebufferTexture2DOES( GL_DRAW_FRAMEBUFFER_APPLE, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, colorTex, 0 );
		else if (colorBuf)
			glFramebufferRenderbufferOES (GL_DRAW_FRAMEBUFFER_APPLE, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, colorBuf);
		
		if (depthTex)
			glFramebufferTexture2DOES( GL_DRAW_FRAMEBUFFER_APPLE, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, depthTex, 0 );
		else if (depthBuf)
			glFramebufferRenderbufferOES (GL_DRAW_FRAMEBUFFER_APPLE, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depthBuf);
		
		UNITY_DBG_LOG ("  bind msaa as READ FBO\n");
		glBindFramebufferOES(GL_READ_FRAMEBUFFER_APPLE, _surface.msaaFramebuffer); 
		UNITY_DBG_LOG ("  glResolveMultisampleFramebufferAPPLE ();\n");
		
		glResolveMultisampleFramebufferAPPLE();
		
		glBindFramebufferOES (GL_FRAMEBUFFER_OES, oldFBO);
		CHECK_GL_ERROR();
		
		#if ENABLE_INTERNAL_PROFILER
		_msaaResolve += (mach_absolute_time() - msaaTime0);
		#endif
		UnityEndProfilerCounter(msaaResolveCounter);
		
		return true;
	}
	#endif
	return false;
}


void PresentSurface(MyEAGLSurface& surface)
{
	UNITY_DBG_LOG ("PresentSurface:\n");
	EAGLContext *oldContext = [EAGLContext currentContext];
	
	if (oldContext != _context)
		[EAGLContext setCurrentContext:_context];
	
#if GL_APPLE_framebuffer_multisample
	if (surface.msaaSamples > 0 && _supportsMSAA)
	{
		UnityStartProfilerCounter(msaaResolveCounter);
		#if ENABLE_INTERNAL_PROFILER
		Prof_Int64 msaaTime0 = mach_absolute_time();
		#endif
		
		UNITY_DBG_LOG ("  ResolveMSAA: samples=%i msaaFBO=%i destFBO=%i\n", surface.msaaSamples, surface.msaaFramebuffer, surface.framebuffer);
		glBindFramebufferOES(GL_READ_FRAMEBUFFER_APPLE, surface.msaaFramebuffer); 
		glBindFramebufferOES(GL_DRAW_FRAMEBUFFER_APPLE, surface.framebuffer);

		glResolveMultisampleFramebufferAPPLE();
		CHECK_GL_ERROR();

		#if ENABLE_INTERNAL_PROFILER
		_msaaResolve += (mach_absolute_time() - msaaTime0);
		#endif
		UnityEndProfilerCounter(msaaResolveCounter);
	}
#endif
	
#if GL_EXT_discard_framebuffer
	if (_supportsDiscard)
	{
		GLenum attachments[3];
		int discardCount = 0;
		if (surface.msaaSamples > 1 && _supportsMSAA)
			attachments[discardCount++] = GL_COLOR_ATTACHMENT0_OES;
		
		if (surface.depthFormat)
			attachments[discardCount++] = GL_DEPTH_ATTACHMENT_OES;
			
		attachments[discardCount++] = GL_STENCIL_ATTACHMENT_OES;
		
		GLenum target = (surface.msaaSamples > 1 && _supportsMSAA)? GL_READ_FRAMEBUFFER_APPLE: GL_FRAMEBUFFER_OES;
		if (discardCount > 0)
			glDiscardFramebufferEXT(target, discardCount, attachments);
	}
#endif

	CHECK_GL_ERROR();
	
	// presentRenderbuffer presents currently bound RB, so make sure we have the correct one bound
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, surface.renderbuffer);	
	if(![_context presentRenderbuffer:GL_RENDERBUFFER_OES])
		EAGL_ERROR("swap renderbuffer");
	
#if GL_APPLE_framebuffer_multisample
	if (_supportsMSAA)
	{
		const int desiredMSAASamples = UnityGetDesiredMSAASampleCount(MSAA_DEFAULT_SAMPLE_COUNT);	
		if (surface.msaaSamples != desiredMSAASamples)
		{
			surface.msaaSamples = desiredMSAASamples;
			CreateSurfaceMultisampleBuffers(&surface);
			glBindRenderbufferOES(GL_RENDERBUFFER_OES, surface.renderbuffer);
		}
		
		if (surface.msaaSamples > 1)
		{
			glBindFramebufferOES(GL_FRAMEBUFFER_OES, surface.msaaFramebuffer);
			gDefaultFBO = surface.msaaFramebuffer;
			UNITY_DBG_LOG ("  glBindFramebufferOES (GL_FRAMEBUFFER_OES, %i); // PresentSurface\n", surface.msaaFramebuffer);
		}
	}
#endif
	
	if(oldContext != _context)
		[EAGLContext setCurrentContext:oldContext];
}

void PresentContext_UnityCallback(struct UnityFrameStats const* unityFrameStats)
{	
#if ENABLE_INTERNAL_PROFILER
	_unityFrameStats = *unityFrameStats;
	
	if (_frameId % BLOCK_ON_GPU_EACH_NTH_FRAME == (BLOCK_ON_GPU_EACH_NTH_FRAME-1))
	{
		Prof_Int64 gpuTime0 = mach_absolute_time();
		
#if ENABLE_BLOCK_ON_GPU_PROFILER
		UnityFinishRendering();
#endif
		
		Prof_Int64 gpuTime1 = mach_absolute_time();
		_gpuDelta = gpuTime1 - gpuTime0;
	}
	else
		_gpuDelta = 0;
#endif
	
	
#if ENABLE_INTERNAL_PROFILER
	Prof_Int64 swapTime0 = mach_absolute_time();
#endif
	
	PresentSurface(_surface);
	
#if ENABLE_INTERNAL_PROFILER
	Prof_Int64 vblankTime = mach_absolute_time();
	
	if (_lastVBlankTime < 0) _lastVBlankTime = vblankTime;
	_frameDelta = vblankTime - _lastVBlankTime; _lastVBlankTime = vblankTime;
	
	Prof_Int64 swapTime1 = vblankTime;
	_swapDelta = swapTime1 - swapTime0;
#endif
}

int OpenEAGL_UnityCallback(UIWindow** window, int* screenWidth, int* screenHeight,  int* openglesVersion)
{
	CGRect rect = [[UIScreen mainScreen] bounds];
	
	// Create a full-screen window
	_window = [[UIWindow alloc] initWithFrame:rect];
	EAGLView* view = [[EAGLView alloc] initWithFrame:rect];
	[_window addSubview:view];

	
	int openglesApi = 
	#if defined(__IPHONE_3_0) && USE_OPENGLES20_IF_AVAILABLE
			kEAGLRenderingAPIOpenGLES2;
	#else
			kEAGLRenderingAPIOpenGLES1;
	#endif
 	
	for (; openglesApi >= kEAGLRenderingAPIOpenGLES1 && !_context; --openglesApi)
	{
			if (!UnityIsRenderingAPISupported(openglesApi))
				continue;
			
			_context = [[EAGLContext alloc] initWithAPI:openglesApi];
	}
	
	if (!_context)
		return false;
	
	if (![EAGLContext setCurrentContext:_context]) {
		_context = 0;
		return false;
	}
	
	if (!CreateWindowSurface(view, GL_RGB565_OES, GL_DEPTH_COMPONENT16_OES, UnityGetDesiredMSAASampleCount(MSAA_DEFAULT_SAMPLE_COUNT), NO, &_surface)) {
		return false;
	}
	
	glViewport(0, 0, _surface.size.width, _surface.size.height);
	[_window makeKeyAndVisible];
	[view release];
	
	*window = _window;
	*screenWidth = _surface.size.width;
	*screenHeight = _surface.size.height;
	*openglesVersion = _context.API;
	
	return true;
}

// --- AppController --------------------------------------------------------------------
//


@implementation AppController

- (void) registerAccelerometer
{
	// NOTE: work-around for accelerometer sometimes failing to register (presumably on older devices)
	// set accelerometer delegate to nil first
	// work-around reported by Brian Robbins
	
	[[UIAccelerometer sharedAccelerometer] setDelegate:nil];	
	if (kAccelerometerFrequency > 1e-6)
	{
		const float accelerometerFrequency = kAccelerometerFrequency;
		[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / accelerometerFrequency)];
		[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	}
}

- (void) Repaint
{
#if ENABLE_INTERNAL_PROFILER
	static int profilerInitialized = false;
	if (!profilerInitialized)
	{
		ProfilerInit();
		profilerInitialized = true;
	}
	
	Prof_Int64 playerTime0 = 0, playerTime1 = 0;
	playerTime0 = mach_absolute_time();
#endif
	
	UnityInputProcess();
	UnityPlayerLoop();
	
#if ENABLE_INTERNAL_PROFILER
	playerTime1 = mach_absolute_time();
#endif

	if (kAccelerometerFrequency > 1e-6 && (!_accelerometerIsActive || ([UIAccelerometer sharedAccelerometer].delegate == nil)))
	{
		static int frameCounter = 0;
		if (frameCounter <= 0)
		{
			// NOTE: work-around for accelerometer sometimes failing to register (presumably on older devices)
			// sometimes even Brian Robbins work-around doesn't help
			// then we will try to register accelerometer every N frames until we succeed
			
			printf_console("-> force accelerometer registration\n");
			[self registerAccelerometer];
			frameCounter = 90; // try every ~3 seconds
		}
		--frameCounter;
	}
	
#if ENABLE_INTERNAL_PROFILER
	Prof_Int64 playerDelta = (playerTime1 - playerTime0) - _swapDelta - _gpuDelta - _unityFrameStats.drawCallTime;
	
	const int EachNthFrame = 30;
	if (_frameId == EachNthFrame)
	{
		_frameId = 0;
		
		printf_console("iPhone Unity internal profiler stats:\n");
		printf_console("cpu-player>    min: %4.1f   max: %4.1f   avg: %4.1f\n", MachToMillisecondsDelta(_playerPB.minV), MachToMillisecondsDelta(_playerPB.maxV), MachToMillisecondsDelta(_playerPB.avgV / EachNthFrame));
		printf_console("cpu-ogles-drv> min: %4.1f   max: %4.1f   avg: %4.1f\n", MachToMillisecondsDelta(_oglesPB.minV), MachToMillisecondsDelta(_oglesPB.maxV), MachToMillisecondsDelta(_oglesPB.avgV / EachNthFrame));
#if ENABLE_BLOCK_ON_GPU_PROFILER
		printf_console("gpu>           min: %4.1f   max: %4.1f   avg: %4.1f\n", MachToMillisecondsDelta(_gpuPB.minV), MachToMillisecondsDelta(_gpuPB.maxV), MachToMillisecondsDelta((BLOCK_ON_GPU_EACH_NTH_FRAME*(int)_gpuPB.avgV) / EachNthFrame));
#endif
		// only pay attention if glClear took significant amount of time (2 milliseconds)
		if (_unityWaitsForGpuPB.avgV >= 2.0)
		{
			printf_console("cpu-waits-gpu> min: %4.1f   max: %4.1f   avg: %4.1f\n", MachToMillisecondsDelta(_unityWaitsForGpuPB.minV), MachToMillisecondsDelta(_unityWaitsForGpuPB.maxV), MachToMillisecondsDelta(_unityWaitsForGpuPB.avgV / EachNthFrame));
			printf_console(" msaa-resolve> min: %4.1f   max: %4.1f   avg: %4.1f\n", MachToMillisecondsDelta(_unityMSAAResolvePB.minV), MachToMillisecondsDelta(_unityMSAAResolvePB.maxV), MachToMillisecondsDelta(_unityMSAAResolvePB.avgV / EachNthFrame));
		}
		printf_console("cpu-present>   min: %4.1f   max: %4.1f   avg: %4.1f\n", MachToMillisecondsDelta(_swapPB.minV), MachToMillisecondsDelta(_swapPB.maxV), MachToMillisecondsDelta(_swapPB.avgV / EachNthFrame));
		printf_console("frametime>     min: %4.1f   max: %4.1f   avg: %4.1f\n", MachToMillisecondsDelta(_framePB.minV), MachToMillisecondsDelta(_framePB.maxV), MachToMillisecondsDelta(_framePB.avgV / EachNthFrame));
		
		printf_console("draw-call #>   min: %3d    max: %3d    avg: %3d     | batched: %5d\n", (int)_drawCallCountPB.minV, (int)_drawCallCountPB.maxV, (int)(_drawCallCountPB.avgV / EachNthFrame), (int)(_batchedDrawCallCountPB.avgV / EachNthFrame));
		printf_console("tris #>        min: %5d  max: %5d  avg: %5d   | batched: %5d\n", (int)_triCountPB.minV, (int)_triCountPB.maxV, (int)(_triCountPB.avgV / EachNthFrame), (int)(_batchedTriCountPB.avgV / EachNthFrame));
		printf_console("verts #>       min: %5d  max: %5d  avg: %5d   | batched: %5d\n", (int)_vertCountPB.minV, (int)_vertCountPB.maxV, (int)(_vertCountPB.avgV / EachNthFrame), (int)(_batchedVertCountPB.avgV / EachNthFrame));
		
		printf_console("player-detail> physx: %4.1f animation: %4.1f culling %4.1f skinning: %4.1f batching: %4.1f render: %4.1f fixed-update-count: %d .. %d\n", 
					   MachToMillisecondsDelta((int)_fixedPhysicsManagerPB.avgV / EachNthFrame),
					   MachToMillisecondsDelta((int)_animationUpdatePB.avgV / EachNthFrame),
					   MachToMillisecondsDelta((int)_unityCullingPB.avgV / EachNthFrame),
					   MachToMillisecondsDelta((int)_skinMeshUpdatePB.avgV / EachNthFrame),
					   MachToMillisecondsDelta((int)_batchPB.avgV / EachNthFrame),
#if INCLUDE_OPENGLES_IN_RENDER_TIME
					   MachToMillisecondsDelta((int)(_unityRenderLoopPB.avgV - _batchPB.avgV - _unityCullingPB.avgV - _unityWaitsForGpuPB.avgV) / EachNthFrame),
#else   
					   MachToMillisecondsDelta((int)(_unityRenderLoopPB.avgV - _oglesPB.avgV - _batchPB.avgV - _unityCullingPB.avgV - _unityWaitsForGpuPB.avgV) / EachNthFrame),
#endif
					   (int)_fixedUpdateCountPB.minV, (int)_fixedUpdateCountPB.maxV);
		printf_console("mono-scripts>  update: %4.1f   fixedUpdate: %4.1f coroutines: %4.1f \n", MachToMillisecondsDelta(_dynamicBehaviourManagerPB.avgV / EachNthFrame), MachToMillisecondsDelta(_fixedBehaviourManagerPB.avgV / EachNthFrame), MachToMillisecondsDelta(_coroutinePB.avgV / EachNthFrame));
		printf_console("mono-memory>   used heap: %d allocated heap: %d  max number of collections: %d collection total duration: %4.1f\n", mono_gc_get_used_size(), mono_gc_get_heap_size(), (int)_GCCountPB.avgV, MachToMillisecondsDelta(_GCDurationPB.avgV));
		printf_console("----------------------------------------\n");
	}
	ProfilerBlock_Update(&_framePB, _frameDelta, (_frameId == 0));
	ProfilerBlock_Update(&_swapPB, _swapDelta, (_frameId == 0));
	
	ProfilerBlock_Update(&_gpuPB, _gpuDelta, (_frameId == 0), true);
	ProfilerBlock_Update(&_playerPB, playerDelta, (_frameId == 0));
	ProfilerBlock_Update(&_oglesPB, _unityFrameStats.drawCallTime, (_frameId == 0));
	
	ProfilerBlock_Update(&_drawCallCountPB, _unityFrameStats.drawCallCount, (_frameId == 0));
	ProfilerBlock_Update(&_triCountPB, _unityFrameStats.triCount, (_frameId == 0));
	ProfilerBlock_Update(&_vertCountPB, _unityFrameStats.vertCount, (_frameId == 0));
	
	ProfilerBlock_Update(&_batchPB, _unityFrameStats.batchDt, (_frameId == 0));
	ProfilerBlock_Update(&_batchedDrawCallCountPB, _unityFrameStats.batchedDrawCallCount, (_frameId == 0));
	ProfilerBlock_Update(&_batchedTriCountPB, _unityFrameStats.batchedTris, (_frameId == 0));
	ProfilerBlock_Update(&_batchedVertCountPB, _unityFrameStats.batchedVerts, (_frameId == 0));
	
	ProfilerBlock_Update(&_fixedBehaviourManagerPB, _unityFrameStats.fixedBehaviourManagerDt, (_frameId == 0));
	ProfilerBlock_Update(&_fixedPhysicsManagerPB, _unityFrameStats.fixedPhysicsManagerDt, (_frameId == 0));
	ProfilerBlock_Update(&_dynamicBehaviourManagerPB, _unityFrameStats.dynamicBehaviourManagerDt, (_frameId == 0));
	ProfilerBlock_Update(&_coroutinePB, _unityFrameStats.coroutineDt, (_frameId == 0));
	ProfilerBlock_Update(&_skinMeshUpdatePB, _unityFrameStats.skinMeshUpdateDt, (_frameId == 0));
	ProfilerBlock_Update(&_animationUpdatePB, _unityFrameStats.animationUpdateDt, (_frameId == 0));
	ProfilerBlock_Update(&_unityRenderLoopPB, _unityFrameStats.renderDt, (_frameId == 0));
	ProfilerBlock_Update(&_unityCullingPB, _unityFrameStats.cullingDt, (_frameId == 0));
	ProfilerBlock_Update(&_unityWaitsForGpuPB, _unityFrameStats.clearDt+_msaaResolve, (_frameId == 0));
	ProfilerBlock_Update(&_unityMSAAResolvePB, _msaaResolve, (_frameId == 0));
	ProfilerBlock_Update(&_fixedUpdateCountPB, _unityFrameStats.fixedUpdateCount, (_frameId == 0));
	ProfilerBlock_Update(&_GCCountPB, 0, (_frameId == 0));
	ProfilerBlock_Update(&_GCDurationPB, 0, (_frameId == 0));
	
	_msaaResolve = 0;

	++_frameId;
#endif	
}

- (void) startRendering:(UIApplication*)application
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; 
    
#if FALLBACK_LOOP_TYPE == THREAD_BASED_LOOP
	const double SecondsPerFrame = 1.0 / (((kFPS) > 60.0)? 60.0: (kFPS));
	const double OneMillisecond = 1.0 / 1000.0;
	for (;;)
	{
		double frameStartTime = (double)CFAbsoluteTimeGetCurrent();
		[self performSelectorOnMainThread:@selector(Repaint) withObject:nil waitUntilDone:YES]; 
		
		double secondsToProcessEvents = SecondsPerFrame - (((double)CFAbsoluteTimeGetCurrent()) - frameStartTime);
		// if we run considerably slower than desired framerate anyhow
		// then we should sleep for a while leaving OS some room to process events
		if (secondsToProcessEvents < -OneMillisecond)
			secondsToProcessEvents = OneMillisecond;
		if (secondsToProcessEvents > 0)
			[NSThread sleepForTimeInterval:secondsToProcessEvents];
	}
	
#elif FALLBACK_LOOP_TYPE == EVENT_PUMP_BASED_LOOP

	int eventLoopTimeOuts = 0;
	const double SecondsPerFrameToProcessEvents = 0.001 * (double)kMillisecondsPerFrameToProcessEvents;
	const double SecondsPerFrame = 1.0 / (((kFPS) > 60.0)? 60.0: (kFPS));
	for (;;)
	{
		double frameStartTime = (double)CFAbsoluteTimeGetCurrent();
		[self Repaint];
		
		if (kMillisecondsPerFrameToProcessEvents <= 0)
		{
			while(CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, TRUE) == kCFRunLoopRunHandledSource);
		}
		else
		{
			double secondsToProcessEvents = SecondsPerFrame - (((double)CFAbsoluteTimeGetCurrent()) - frameStartTime);
			if(secondsToProcessEvents < SecondsPerFrameToProcessEvents)
				secondsToProcessEvents = SecondsPerFrameToProcessEvents;
			
			if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, secondsToProcessEvents, FALSE) == kCFRunLoopRunTimedOut)
				++eventLoopTimeOuts;
		}
	}
	
#endif
	[pool release];
}

- (void) startUnity:(UIApplication*)application
{	
#if ENABLE_INTERNAL_PROFILER
	GC_notify_event = (void*)gccallback;
#endif
	
	char const* appPath = [[[NSBundle mainBundle] bundlePath]UTF8String];
	UnityInitApplication(appPath);
	
	_displayLink = nil;
#if USE_DISPLAY_LINK_IF_AVAILABLE
	// A system version of 3.1 or greater is required to use CADisplayLink. The NSTimer
	// class is used as fallback when it isn't available.
	NSString *reqSysVer = @"3.1";
	NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
	if ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending)
	{
		// Frame interval defines how many display frames must pass between each time the
		// display link fires.
		int animationFrameInterval = (60.0 / (kFPS));
		if (animationFrameInterval < 1)
			animationFrameInterval = 1;
		
		_displayLink = [NSClassFromString(@"CADisplayLink") displayLinkWithTarget:self selector:@selector(Repaint)];
		[_displayLink setFrameInterval:animationFrameInterval];
		[_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	}
#endif
	
	if (_displayLink == nil)
	{
#if FALLBACK_LOOP_TYPE == NSTIMER_BASED_LOOP
		_timer = [NSTimer scheduledTimerWithTimeInterval:(1.0 / (kFPS * kThrottleFPS)) target:self selector:@selector(Repaint) userInfo:nil repeats:YES];
#endif
	}
	
	[self registerAccelerometer];
	KeyboardOnScreen::Init();

	if (_displayLink == nil)
	{
#if FALLBACK_LOOP_TYPE == THREAD_BASED_LOOP
		[NSThread detachNewThreadSelector:@selector(startRendering:) toTarget:self withObject:nil];
#elif FALLBACK_LOOP_TYPE == EVENT_PUMP_BASED_LOOP
		[self performSelectorOnMainThread:@selector(startRendering:) withObject:application waitUntilDone:NO];
#endif
	}
	
	// init profiler
	if( msaaResolveCounter == 0 )
		msaaResolveCounter = UnityCreateProfilerCounter("iOS.MSAAResolve");
	
	// immediately render 1st frame in order to avoid occasional black screen
	// we do it twice to fill both buffers with meaningful contents.
	[self Repaint];
	[self Repaint];
}

- (void) applicationDidFinishLaunching:(UIApplication*)application
{
	printf_console("-> applicationDidFinishLaunching()\n");
	[self startUnity:application];
}

// For iOS 4
// Callback order:
//   applicationDidResignActive()
//   applicationDidEnterBackground()
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    printf_console("-> applicationDidEnterBackground()\n");
}

// For iOS 4
// Callback order:
//   applicationWillEnterForeground()
//   applicationDidBecomeActive()
- (void)applicationWillEnterForeground:(UIApplication *)application
{
	printf_console("-> applicationWillEnterForeground()\n");
}
	
- (void) applicationDidBecomeActive:(UIApplication*)application
{
	printf_console("-> applicationDidBecomeActive()\n");
	if (_didResignActive)
	{
		UnityPause(false);
	}

	_didResignActive = NO;
}

- (void) applicationWillResignActive:(UIApplication*)application
{
	printf_console("-> applicationDidResignActive()\n");
	UnityPause(true);
	
	_didResignActive = YES;
}

- (void) applicationDidReceiveMemoryWarning:(UIApplication*)application
{
	printf_console("WARNING -> applicationDidReceiveMemoryWarning()\n");
}

- (void) applicationWillTerminate:(UIApplication*)application
{
	printf_console("-> applicationWillTerminate()\n");

	UnityDestroyProfilerCounter(msaaResolveCounter);

	UnityCleanup();
}

- (void) dealloc
{
	DestroySurface(&_surface);
	[_context release];
	_context = nil;
	
	[_window release];	
	[super dealloc];
}

- (void) accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{
	UnityDidAccelerate(acceleration.x, acceleration.y, acceleration.z, acceleration.timestamp);
	_accelerometerIsActive = YES;
}

@end

@implementation EAGLView

+ (Class) layerClass
{
	return [CAEAGLLayer class];
}

- (id) initWithFrame:(CGRect)frame
{
	if((self = [super initWithFrame:frame])) {
		[self setMultipleTouchEnabled:YES];
		[self setExclusiveTouch:YES];
	}
	return self;
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	UnitySendTouchesBegin(touches, event);
}
- (void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
	UnitySendTouchesEnded(touches, event);
}
- (void) touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event
{
	UnitySendTouchesCancelled(touches, event);
}
- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
	UnitySendTouchesMoved(touches, event);
}

@end

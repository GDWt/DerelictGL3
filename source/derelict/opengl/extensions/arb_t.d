/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opengl.extensions.arb_t;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_tessellation_shader <-- Core in GL 4.0
enum ARB_tessellation_shader = "GL_ARB_tessellation_shader";
enum arbTesselationShaderDecls =
q{
enum : uint
{
    GL_PATCHES                        = 0x000E,
    GL_PATCH_VERTICES                 = 0x8E72,
    GL_PATCH_DEFAULT_INNER_LEVEL      = 0x8E73,
    GL_PATCH_DEFAULT_OUTER_LEVEL      = 0x8E74,
    GL_TESS_CONTROL_OUTPUT_VERTICES   = 0x8E75,
    GL_TESS_GEN_MODE                  = 0x8E76,
    GL_TESS_GEN_SPACING               = 0x8E77,
    GL_TESS_GEN_VERTEX_ORDER          = 0x8E78,
    GL_TESS_GEN_POINT_MODE            = 0x8E79,
    GL_ISOLINES                       = 0x8E7A,
    GL_FRACTIONAL_ODD                 = 0x8E7B,
    GL_FRACTIONAL_EVEN                = 0x8E7C,
    GL_MAX_PATCH_VERTICES             = 0x8E7D,
    GL_MAX_TESS_GEN_LEVEL             = 0x8E7E,
    GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E7F,
    GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E80,
    GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS = 0x8E81,
    GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS = 0x8E82,
    GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS = 0x8E83,
    GL_MAX_TESS_PATCH_COMPONENTS      = 0x8E84,
    GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS = 0x8E85,
    GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS = 0x8E86,
    GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS = 0x8E89,
    GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS = 0x8E8A,
    GL_MAX_TESS_CONTROL_INPUT_COMPONENTS = 0x886C,
    GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS = 0x886D,
    GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E1E,
    GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E1F,
    GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER = 0x84F0,
    GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x84F1,
    GL_TESS_EVALUATION_SHADER         = 0x8E87,
    GL_TESS_CONTROL_SHADER            = 0x8E88,
}
extern(System) @nogc nothrow {
    alias da_glPatchParameteri = void function(GLenum, GLint);
    alias da_glPatchParameterfv = void function(GLenum, const(GLfloat)*);
}};

enum arbTesselationShaderFuncs =
q{
    da_glPatchParameteri glPatchParameteri;
    da_glPatchParameterfv glPatchParameterfv;
};

enum arbTesselationShaderLoaderImpl =
q{
    bindGLFunc(cast(void**)&glPatchParameteri, "glPatchParameteri");
    bindGLFunc(cast(void**)&glPatchParameterfv, "glPatchParameterfv");
};

enum arbTesselationShaderLoader = makeLoader(ARB_tessellation_shader, arbTesselationShaderLoaderImpl, "gl40");
static if(!usingContexts) enum arbTesselationShader = arbTesselationShaderDecls ~ arbTesselationShaderFuncs.makeGShared() ~ arbTesselationShaderLoader;

// ARB_texture_barrier <-- Core in GL 4.5
enum ARB_texture_barrier = "GL_ARB_texture_barrier";
enum arbTextureBarrierDecls = `extern(System) @nogc nothrow alias da_glTextureBarrier = void function();`;
enum arbTextureBarrierFuncs = `da_glTextureBarrier glTextureBarrier;`;
enum arbTextureBarrierLoaderImpl = `bindGLFunc(cast(void**)&glTextureBarrier, "glTextureBarrier");`;
enum arbTextureBarrierLoader = makeLoader(ARB_texture_barrier, arbTextureBarrierLoaderImpl, "gl45");
static if(!usingContexts) enum arbTextureBarrier = arbTextureBarrierDecls ~ arbTextureBarrierFuncs.makeGShared() ~ arbTextureBarrierLoader;

// ARB_texture_buffer_object_rgb32 <-- Core in GL 4.0
enum ARB_texture_buffer_object_rgb32 = "GL_ARB_texture_buffer_object_rgb32";
enum arbTextureBufferObjectRGB32Loader = makeLoader(ARB_texture_buffer_object_rgb32, "", "gl40");
static if(!usingContexts) enum arbTextureBufferObjectRGB32 = arbTextureBufferObjectRGB32Loader;

// ARB_texture_buffer_range <-- Core in GL 4.3
enum ARB_texture_buffer_range = "GL_ARB_texture_buffer_range";
enum arbTextureBufferRangeDecls =
q{
enum : uint
{
    GL_TEXTURE_BUFFER_OFFSET = 0x919D,
    GL_TEXTURE_BUFFER_SIZE = 0x919E,
    GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT = 0x919F,
}
extern(System) @nogc nothrow
{
    alias da_glTexBufferRange = void function(GLenum,GLenum,GLuint,GLintptr,GLsizeiptr);
    alias da_glTextureBufferRangeEXT = void function(GLuint,GLenum,GLenum,GLuint,GLintptr,GLsizeiptr);
}};

enum arbTextureBufferRangeFuncs =
q{
    da_glTexBufferRange glTexBufferRange;
    da_glTextureBufferRangeEXT glTextureBufferRangeEXT;
};

enum arbTextureBufferRangeLoaderImpl =
q{
    bindGLFunc(cast(void**)&glTexBufferRange, "glTexBufferRange");
    bindGLFunc(cast(void**)&glTextureBufferRangeEXT, "glTextureBufferRangeEXT");
};

enum arbTextureBufferRangeLoader = makeLoader(ARB_texture_buffer_range, arbTextureBufferRangeLoaderImpl, "gl43");
static if(!usingContexts) enum arbTextureBufferRange = arbTextureBufferRangeDecls ~ arbTextureBufferRangeFuncs.makeGShared() ~ arbTextureBufferRangeLoader;

// ARB_texture_compression_bptc
enum ARB_texture_compression_bptc = "GL_ARB_texture_compression_bptc";
enum arbTextureCompressionBPTCDecls =
q{
enum : uint
{
    GL_COMPRESSED_RGBA_BPTC_UNORM_ARB = 0x8E8C,
    GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB = 0x8E8D,
    GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB = 0x8E8E,
    GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = 0x8E8F,
}};

enum arbTextureCompressionBPTCLoader = makeExtLoader(ARB_texture_compression_bptc);
static if(!usingContexts) enum arbTextureCompressionBPTC = arbTextureCompressionBPTCDecls ~ arbTextureCompressionBPTCLoader;

// ARB_texture_cube_map_array
enum ARB_texture_cube_map_array = "GL_ARB_texture_cube_map_array";
enum arbTextureCubeMapArrayDecls =
q{
enum : uint
{
    GL_TEXTURE_CUBE_MAP_ARRAY_ARB     = 0x9009,
    GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB = 0x900A,
    GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB = 0x900B,
    GL_SAMPLER_CUBE_MAP_ARRAY_ARB     = 0x900C,
    GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB = 0x900D,
    GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900E,
    GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900F,
}};

enum arbTextureCubeMapArrayLoader = makeExtLoader(ARB_texture_cube_map_array);
static if(!usingContexts) enum arbTextureCubeMapArray = arbTextureCubeMapArrayDecls ~ arbTextureCubeMapArrayLoader;

// ARB_texture_gather
enum ARB_texture_gather = "GL_ARB_texture_gather";
enum arbTextureGatherDecls =
q{
enum : uint
{
    GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5E,
    GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5F,
}};

enum arbTextureGatherLoader = makeExtLoader(ARB_texture_gather);
static if(!usingContexts) enum arbTextureGather = arbTextureGatherDecls ~ arbTextureGatherLoader;

// ARB_texture_mirror_clamp_to_edge <-- Core in GL 4.4
enum ARB_texture_mirror_clamp_to_edge = "GL_ARB_texture_mirror_clamp_to_edge";
enum arbTextureMirrorClampToEdgeDecls = `enum uint GL_MIRROR_CLAMP_TO_EDGE = 0x8743;`;
enum arbTextureMirrorClampToEdgeLoader = makeLoader(ARB_texture_mirror_clamp_to_edge, "", "gl44");
static if(!usingContexts) enum arbTextureMirrorClampToEdge = arbTextureMirrorClampToEdgeDecls ~ arbTextureMirrorClampToEdgeLoader;

// ARB_texture_multisample <-- Core in GL 3.2
enum ARB_texture_multisample = "GL_ARB_texture_multisample";
enum arbTextureMultiSampleDecls =
q{
enum : uint
{
    GL_SAMPLE_POSITION                = 0x8E50,
    GL_SAMPLE_MASK                    = 0x8E51,
    GL_SAMPLE_MASK_VALUE              = 0x8E52,
    GL_MAX_SAMPLE_MASK_WORDS          = 0x8E59,
    GL_TEXTURE_2D_MULTISAMPLE         = 0x9100,
    GL_PROXY_TEXTURE_2D_MULTISAMPLE   = 0x9101,
    GL_TEXTURE_2D_MULTISAMPLE_ARRAY   = 0x9102,
    GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9103,
    GL_TEXTURE_BINDING_2D_MULTISAMPLE = 0x9104,
    GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 0x9105,
    GL_TEXTURE_SAMPLES                = 0x9106,
    GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = 0x9107,
    GL_SAMPLER_2D_MULTISAMPLE         = 0x9108,
    GL_INT_SAMPLER_2D_MULTISAMPLE     = 0x9109,
    GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 0x910A,
    GL_SAMPLER_2D_MULTISAMPLE_ARRAY   = 0x910B,
    GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C,
    GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D,
    GL_MAX_COLOR_TEXTURE_SAMPLES      = 0x910E,
    GL_MAX_DEPTH_TEXTURE_SAMPLES      = 0x910F,
    GL_MAX_INTEGER_SAMPLES            = 0x9110,
}

extern(System) @nogc nothrow {
    alias da_glTexImage2DMultisample = void function(GLenum, GLsizei, GLint, GLsizei, GLsizei, GLboolean);
    alias da_glTexImage3DMultisample = void function(GLenum, GLsizei, GLint, GLsizei, GLsizei, GLsizei, GLboolean);
    alias da_glGetMultisamplefv = void function(GLenum, GLuint, GLfloat*);
    alias da_glSampleMaski = void function(GLuint, GLbitfield);
}};

enum arbTextureMultiSampleFuncs =
q{
    da_glTexImage2DMultisample glTexImage2DMultisample;
    da_glTexImage3DMultisample glTexImage3DMultisample;
    da_glGetMultisamplefv glGetMultisamplefv;
    da_glSampleMaski glSampleMaski;
};

enum arbTextureMultiSampleLoaderImpl =
q{
    bindGLFunc(cast(void**)&glTexImage2DMultisample, "glTexImage2DMultisample");
    bindGLFunc(cast(void**)&glTexImage3DMultisample, "glTexImage3DMultisample");
    bindGLFunc(cast(void**)&glGetMultisamplefv, "glGetMultisamplefv");
    bindGLFunc(cast(void**)&glSampleMaski, "glSampleMaski");
};

enum arbTextureMultiSampleLoader = makeLoader(ARB_texture_multisample, arbTextureMultiSampleLoaderImpl, "gl32");
static if(!usingContexts) enum arbTextureMultiSample = arbTextureMultiSampleDecls ~ arbTextureMultiSampleFuncs.makeGShared() ~ arbTextureMultiSampleLoader;

// ARB_texture_query_levels <-- Core in GL 4.3
enum ARB_texture_query_levels = "GL_ARB_texture_query_levels";
enum arbTextureQueryLevelsLoader = makeLoader(ARB_texture_query_levels, "", "gl43");
static if(!usingContexts) enum arbTextureQueryLevels = arbTextureQueryLevelsLoader;

// ARB_texture_query_lod <-- Core in GL 4.0
enum ARB_texture_query_lod = "GL_ARB_texture_query_lod";
enum arbTextureQueryLODLoader = makeLoader(ARB_texture_query_lod, "", "gl40");
static if(!usingContexts) enum arbTextureQueryLOD = arbTextureQueryLODLoader;

// ARB_texture_rgb10_a2ui <-- Core in GL 3.3
enum ARB_texture_rgb10_a2ui = "GL_ARB_texture_rgb10_a2ui";
enum arbTextureRGB10A2UIDecls = `enum uint GL_RGB10_A2UI = 0x906F;`;
enum arbTextureRGB10A2UILoader = makeLoader(ARB_texture_rgb10_a2ui, "", "gl33");
static if(!usingContexts) enum arbTextureRGB10A2UI = arbTextureRGB10A2UIDecls ~ arbTextureRGB10A2UILoader;

// ARB_texture_stencil8 <-- Core in GL 4.4
enum ARB_texture_stencil8 = "GL_ARB_texture_stencil8";
enum arbTextureStencil8Loader = makeLoader(ARB_texture_stencil8, "", "gl44");
static if(!usingContexts) enum arbTextureStencil8 = arbTextureStencil8Loader;

// ARB_texture_storage <-- Core in GL 4.2
enum ARB_texture_storage = "GL_ARB_texture_storage";
enum arbTextureStorageDecls =
q{
enum uint GL_TEXTURE_IMMUTABLE_FORMAT = 0x912F;
extern(System) @nogc nothrow {
    alias da_glTexStorage1D = void function(GLenum, GLsizei, GLenum, GLsizei);
    alias da_glTexStorage2D = void function(GLenum, GLsizei, GLenum, GLsizei, GLsizei);
    alias da_glTexStorage3D = void function(GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLsizei);
    alias da_glTextureStorage1DEXT = void function(GLuint, GLenum, GLsizei, GLenum, GLsizei);
    alias da_glTextureStorage2DEXT = void function(GLuint, GLenum, GLsizei, GLenum, GLsizei, GLsizei);
    alias da_glTextureStorage3DEXT = void function(GLuint, GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLsizei);
}};

enum arbTextureStorageFuncs =
q{
    da_glTexStorage1D glTexStorage1D;
    da_glTexStorage2D glTexStorage2D;
    da_glTexStorage3D glTexStorage3D;
    da_glTextureStorage1DEXT glTextureStorage1DEXT;
    da_glTextureStorage2DEXT glTextureStorage2DEXT;
    da_glTextureStorage3DEXT glTextureStorage3DEXT;
};

enum arbTextureStorageLoaderImpl =
q{
    bindGLFunc(cast(void**)&glTexStorage1D, "glTexStorage1D");
    bindGLFunc(cast(void**)&glTexStorage2D, "glTexStorage2D");
    bindGLFunc(cast(void**)&glTexStorage3D, "glTexStorage3D");
    // The following are present if EXT_direct_state_access is supported.
    try {
        bindGLFunc(cast(void**)&glTextureStorage1DEXT, "glTextureStorage1DEXT");
        bindGLFunc(cast(void**)&glTextureStorage2DEXT, "glTextureStorage2DEXT");
        bindGLFunc(cast(void**)&glTextureStorage3DEXT, "glTextureStorage3DEXT");
    }
    catch(Exception e) {}
};

enum arbTextureStorageLoader = makeLoader(ARB_texture_storage, arbTextureStorageLoaderImpl, "gl42");
static if(!usingContexts) enum arbTextureStorage = arbTextureStorageDecls ~ arbTextureStorageFuncs.makeGShared() ~ arbTextureStorageLoader;

// ARB_texture_storage_multisample <-- Core in GL 4.3
enum ARB_texture_storage_multisample = "GL_ARB_texture_storage_multisample";
enum arbTextureStorageMultisampleDecls =
q{
extern(System) @nogc nothrow {
    alias da_glTexStorage2DMultisample = void function(GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLboolean);
    alias da_glTexStorage3DMultisample = void function(GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLsizei,GLboolean);
    alias da_glTextureStorage2DMultisampleEXT = void function(GLuint,GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLboolean);
    alias da_glTextureStorage3DMultisampleEXT = void function(GLuint,GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLsizei,GLboolean);
}};

enum arbTextureStorageMultisampleFuncs =
q{
    da_glTexStorage2DMultisample glTexStorage2DMultisample;
    da_glTexStorage3DMultisample glTexStorage3DMultisample;
    da_glTextureStorage2DMultisampleEXT glTextureStorage2DMultisampleEXT;
    da_glTextureStorage3DMultisampleEXT glTextureStorage3DMultisampleEXT;
};

enum arbTextureStorageMultisampleLoaderImpl =
q{
    bindGLFunc(cast(void**)&glTexStorage2DMultisample, "glTexStorage2DMultisample");
    bindGLFunc(cast(void**)&glTexStorage3DMultisample, "glTexStorage3DMultisample");
    try {
        bindGLFunc(cast(void**)&glTextureStorage2DMultisampleEXT, "glTextureStorage2DMultisampleEXT");
        bindGLFunc(cast(void**)&glTextureStorage3DMultisampleEXT, "glTextureStorage3DMultisampleEXT");
    }
    catch(Exception e){}
};

enum arbTextureStorageMultisampleLoader = makeLoader(ARB_texture_storage_multisample, arbTextureStorageMultisampleLoaderImpl, "gl43");
static if(!usingContexts) enum arbTextureStorageMultisample = arbTextureStorageMultisampleDecls ~ arbTextureStorageMultisampleFuncs.makeGShared() ~ arbTextureStorageMultisampleLoader;

// ARB_texture_swizzle <-- Core in GL 3.3
enum ARB_texture_swizzle = "GL_ARB_texture_swizzle";
enum arbTextureSwizzleDecls =
q{
enum : uint
{
    GL_TEXTURE_SWIZZLE_R              = 0x8E42,
    GL_TEXTURE_SWIZZLE_G              = 0x8E43,
    GL_TEXTURE_SWIZZLE_B              = 0x8E44,
    GL_TEXTURE_SWIZZLE_A              = 0x8E45,
    GL_TEXTURE_SWIZZLE_RGBA           = 0x8E46,
}};

enum arbTextureSwizzleLoader = makeLoader(ARB_texture_swizzle, "", "gl33");
static if(!usingContexts) enum arbTextureSwizzle = arbTextureSwizzleDecls ~ arbTextureSwizzleLoader;

// ARB_texture_view <-- Core in GL 4.3
enum ARB_texture_view = "GL_ARB_texture_view";
enum arbTextureViewDecls =
q{
enum : uint
{
    GL_TEXTURE_VIEW_MIN_LEVEL         = 0x82DB,
    GL_TEXTURE_VIEW_NUM_LEVELS        = 0x82DC,
    GL_TEXTURE_VIEW_MIN_LAYER         = 0x82DD,
    GL_TEXTURE_VIEW_NUM_LAYERS        = 0x82DE,
    GL_TEXTURE_IMMUTABLE_LEVELS       = 0x82DF,
}
extern(System) @nogc nothrow alias da_glTextureView = void function(GLuint,GLenum,GLuint,GLenum,GLuint,GLuint,GLuint,GLuint);
};
enum arbTextureViewFuncs = `da_glTextureView glTextureView;`;
enum arbTextureViewLoaderImpl = `bindGLFunc(cast(void**)&glTextureView, "glTextureView");`;

enum arbTextureViewLoader = makeLoader(ARB_texture_view, arbTextureViewLoaderImpl, "gl43");
static if(!usingContexts) enum arbTextureView = arbTextureViewDecls ~ arbTextureViewFuncs.makeGShared() ~ arbTextureViewLoader;

// ARB_timer_query <-- Core in GL 3.3
enum ARB_timer_query = "GL_ARB_timer_query";
enum arbTimerQueryDecls =
q{
enum : uint {
    GL_TIME_ELAPSED                   = 0x88BF,
    GL_TIMESTAMP                      = 0x8E28,
}
extern(System) @nogc nothrow
{
    alias da_glQueryCounter = void function(GLuint, GLenum);
    alias da_glGetQueryObjecti64v = void function(GLuint, GLenum, GLint64*);
    alias da_glGetQueryObjectui64v = void function(GLuint, GLenum, GLuint64*);
}};

enum arbTimerQueryFuncs =
q{
    da_glQueryCounter glQueryCounter;
    da_glGetQueryObjecti64v glGetQueryObjecti64v;
    da_glGetQueryObjectui64v glGetQueryObjectui64v;
};

enum arbTimerQueryLoaderImpl =
q{
    bindGLFunc(cast(void**)&glQueryCounter, "glQueryCounter");
    bindGLFunc(cast(void**)&glGetQueryObjecti64v, "glGetQueryObjecti64v");
    bindGLFunc(cast(void**)&glGetQueryObjectui64v, "glGetQueryObjectui64v");
};

enum arbTimerQueryLoader = makeLoader(ARB_timer_query, arbTimerQueryLoaderImpl, "gl33");
static if(!usingContexts) enum arbTimerQuery = arbTimerQueryDecls ~ arbTimerQueryFuncs.makeGShared() ~ arbTimerQueryLoader;

// ARB_transform_feedback2 <-- Core in GL 4.0
enum ARB_transform_feedback2 = "GL_ARB_transform_feedback2";
enum arbTransformFeedback2Decls =
q{
enum : uint
{
    GL_TRANSFORM_FEEDBACK             = 0x8E22,
    GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED = 0x8E23,
    GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE = 0x8E24,
    GL_TRANSFORM_FEEDBACK_BINDING     = 0x8E25,
}
extern(System) @nogc nothrow {
    alias da_glBindTransformFeedback = void function(GLenum, GLuint);
    alias da_glDeleteTransformFeedbacks = void function(GLsizei, const(GLuint)*);
    alias da_glGenTransformFeedbacks = void function(GLsizei, GLuint*);
    alias da_glIsTransformFeedback = GLboolean function(GLuint);
    alias da_glPauseTransformFeedback = void function();
    alias da_glResumeTransformFeedback = void function();
    alias da_glDrawTransformFeedback = void function(GLenum, GLuint);
}};

enum arbTransformFeedback2Funcs =
q{
    da_glBindTransformFeedback glBindTransformFeedback;
    da_glDeleteTransformFeedbacks glDeleteTransformFeedbacks;
    da_glGenTransformFeedbacks glGenTransformFeedbacks;
    da_glIsTransformFeedback glIsTransformFeedback;
    da_glPauseTransformFeedback glPauseTransformFeedback;
    da_glResumeTransformFeedback glResumeTransformFeedback;
    da_glDrawTransformFeedback glDrawTransformFeedback;
};

enum arbTransformFeedback2LoaderImpl =
q{
    bindGLFunc(cast(void**)&glBindTransformFeedback, "glBindTransformFeedback");
    bindGLFunc(cast(void**)&glDeleteTransformFeedbacks, "glDeleteTransformFeedbacks");
    bindGLFunc(cast(void**)&glGenTransformFeedbacks, "glGenTransformFeedbacks");
    bindGLFunc(cast(void**)&glIsTransformFeedback, "glIsTransformFeedback");
    bindGLFunc(cast(void**)&glPauseTransformFeedback, "glPauseTransformFeedback");
    bindGLFunc(cast(void**)&glResumeTransformFeedback, "glResumeTransformFeedback");
    bindGLFunc(cast(void**)&glDrawTransformFeedback, "glDrawTransformFeedback");
};

enum arbTransformFeedback2Loader = makeLoader(ARB_transform_feedback2, arbTransformFeedback2LoaderImpl, "gl40");
static if(!usingContexts) enum arbTransformFeedback2 = arbTransformFeedback2Decls ~ arbTransformFeedback2Funcs.makeGShared() ~ arbTransformFeedback2Loader;

// ARB_transform_feedback3 <-- Core in GL 4.0
enum ARB_transform_feedback3 = "GL_ARB_transform_feedback3";
enum arbTransformFeedback3Decls =
q{
enum : uint
{
    GL_MAX_TRANSFORM_FEEDBACK_BUFFERS = 0x8E70,
    GL_MAX_VERTEX_STREAMS             = 0x8E71,
}
extern(System) @nogc nothrow {
    alias da_glDrawTransformFeedbackStream = void function(GLenum, GLuint, GLuint);
    alias da_glBeginQueryIndexed = void function(GLenum, GLuint, GLuint);
    alias da_glEndQueryIndexed = void function(GLenum, GLuint);
    alias da_glGetQueryIndexediv = void function(GLenum, GLuint, GLenum, GLint*);
}};

enum arbTransformFeedback3Funcs =
q{
    da_glDrawTransformFeedbackStream glDrawTransformFeedbackStream;
    da_glBeginQueryIndexed glBeginQueryIndexed;
    da_glEndQueryIndexed glEndQueryIndexed;
    da_glGetQueryIndexediv glGetQueryIndexediv;
};

enum arbTransformFeedback3LoaderImpl =
q{
    bindGLFunc(cast(void**)&glDrawTransformFeedbackStream, "glDrawTransformFeedbackStream");
    bindGLFunc(cast(void**)&glBeginQueryIndexed, "glBeginQueryIndexed");
    bindGLFunc(cast(void**)&glEndQueryIndexed, "glEndQueryIndexed");
    bindGLFunc(cast(void**)&glGetQueryIndexediv, "glGetQueryIndexediv");
};

enum arbTransformFeedback3Loader = makeLoader(ARB_transform_feedback3, arbTransformFeedback3LoaderImpl, "gl40");
static if(!usingContexts) enum arbTransformFeedback3 = arbTransformFeedback3Decls ~ arbTransformFeedback3Funcs.makeGShared() ~ arbTransformFeedback3Loader;

// ARB_transform_feedback_instanced <-- Core in GL 4.2
enum ARB_transform_feedback_instanced = "GL_ARB_transform_feedback_instanced";
enum arbTransformFeedbackInstancedDecls =
q{
extern(System) @nogc nothrow {
    alias da_glDrawTransformFeedbackInstanced = void function(GLenum, GLuint, GLsizei);
    alias da_glDrawTransformFeedbackStreamInstanced = void function(GLenum, GLuint, GLuint, GLsizei);
}};

enum arbTransformFeedbackInstancedFuncs =
q{
    da_glDrawTransformFeedbackInstanced glDrawTransformFeedbackInstanced;
    da_glDrawTransformFeedbackStreamInstanced glDrawTransformFeedbackStreamInstanced;
};

enum arbTransformFeedbackInstancedLoaderImpl =
q{
    bindGLFunc(cast(void**)&glDrawTransformFeedbackInstanced, "glDrawTransformFeedbackInstanced");
    bindGLFunc(cast(void**)&glDrawTransformFeedbackStreamInstanced, "glDrawTransformFeedbackStreamInstanced");
};

enum arbTransformFeedbackInstancedLoader = makeLoader(ARB_transform_feedback_instanced, arbTransformFeedbackInstancedLoaderImpl, "gl42");
static if(!usingContexts) enum arbTransformFeedbackInstanced = arbTransformFeedbackInstancedDecls ~ arbTransformFeedbackInstancedFuncs.makeGShared() ~ arbTransformFeedbackInstancedLoader;
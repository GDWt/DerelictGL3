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
module derelict.opengl.extensions.arb_d;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_debug_output <-- Core in GL 4.3
enum ARB_debug_output = "GL_ARB_debug_output";
enum arbDebugOutputDecls =
q{
enum : uint
{
    GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB   = 0x8242,
    GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB = 0x8243,
    GL_DEBUG_CALLBACK_FUNCTION_ARB    = 0x8244,
    GL_DEBUG_CALLBACK_USER_PARAM_ARB  = 0x8245,
    GL_DEBUG_SOURCE_API_ARB           = 0x8246,
    GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB = 0x8247,
    GL_DEBUG_SOURCE_SHADER_COMPILER_ARB = 0x8248,
    GL_DEBUG_SOURCE_THIRD_PARTY_ARB   = 0x8249,
    GL_DEBUG_SOURCE_APPLICATION_ARB   = 0x824A,
    GL_DEBUG_SOURCE_OTHER_ARB         = 0x824B,
    GL_DEBUG_TYPE_ERROR_ARB           = 0x824C,
    GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB = 0x824D,
    GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB = 0x824E,
    GL_DEBUG_TYPE_PORTABILITY_ARB     = 0x824F,
    GL_DEBUG_TYPE_PERFORMANCE_ARB     = 0x8250,
    GL_DEBUG_TYPE_OTHER_ARB           = 0x8251,
    GL_MAX_DEBUG_MESSAGE_LENGTH_ARB   = 0x9143,
    GL_MAX_DEBUG_LOGGED_MESSAGES_ARB  = 0x9144,
    GL_DEBUG_LOGGED_MESSAGES_ARB      = 0x9145,
    GL_DEBUG_SEVERITY_HIGH_ARB        = 0x9146,
    GL_DEBUG_SEVERITY_MEDIUM_ARB      = 0x9147,
    GL_DEBUG_SEVERITY_LOW_ARB         = 0x9148,
}
extern(System) nothrow {
    alias GLDEBUGPROCARB = void function(GLenum, GLenum, GLuint, GLenum, GLsizei, in GLchar*, GLvoid*);
    alias GLDEBUGPROCAMD = void function(GLuint, GLenum, GLenum, GLsizei, in GLchar*, GLvoid*);
}
extern(System) @nogc nothrow {
    alias da_glDebugMessageControlARB = void function(GLenum, GLenum, GLenum, GLsizei, const(GLuint)*, GLboolean);
    alias da_glDebugMessageInsertARB = void function(GLenum, GLenum, GLuint, GLenum, GLsizei, const(GLchar)*);
    alias da_glGetDebugMessageLogARB = void function(GLuint, GLsizei, GLenum*, GLenum*, GLuint*, GLenum*, GLsizei*, GLchar*);
    alias da_glDebugMessageCallbackARB = void function(GLDEBUGPROCARB, const(GLvoid)*);
}};

enum arbDebugOutputFuncs =
q{
    da_glDebugMessageControlARB glDebugMessageControlARB;
    da_glDebugMessageInsertARB glDebugMessageInsertARB;
    da_glDebugMessageCallbackARB glDebugMessageCallbackARB;
    da_glGetDebugMessageLogARB glGetDebugMessageLogARB;
};

enum arbDebugOutputLoaderImpl =
q{
    bindGLFunc(cast(void**)&glDebugMessageControlARB, "glDebugMessageControlARB");
    bindGLFunc(cast(void**)&glDebugMessageInsertARB, "glDebugMessageInsertARB");
    bindGLFunc(cast(void**)&glDebugMessageCallbackARB, "glDebugMessageCallbackARB");
    bindGLFunc(cast(void**)&glGetDebugMessageLogARB, "glGetDebugMessageLogARB");
};

enum arbDebugOutputLoader = makeLoader(ARB_debug_output, arbDebugOutputLoaderImpl, "gl43");
static if(!usingContexts) enum arbDebugOutput = arbDebugOutputDecls ~ arbDebugOutputFuncs.makeGShared() ~ arbDebugOutputLoader;

// ARB_depth_buffer_float <-- Core in GL 3.0
enum ARB_depth_buffer_float = "GL_ARB_depth_buffer_float";
enum arbDepthBufferFloatDecls =
q{
enum : uint
{
    GL_DEPTH_COMPONENT32F             = 0x8CAC,
    GL_DEPTH32F_STENCIL8              = 0x8CAD,
    GL_FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD,
}};

enum arbDepthBufferFloatLoader = makeLoader(ARB_depth_buffer_float, "", "gl30");
static if(!usingContexts) enum arbDepthBufferFloat = arbDepthBufferFloatDecls ~ arbDepthBufferFloatLoader;

// ARB_depth_clamp <-- Core in GL 3.2
enum ARB_depth_clamp = "GL_ARB_depth_clamp";
enum arbDepthClampDecls = `enum uint GL_DEPTH_CLAMP = 0x864F;`;
enum arbDepthClampLoader = makeLoader(ARB_depth_clamp, "", "gl32");
static if(!usingContexts) enum arbDepthClamp = arbDepthClampDecls ~ arbDepthClampLoader;

// ARB_derivative_control <-- Core in GL 4.5
enum ARB_derivative_control = "GL_ARB_derivative_control";
enum arbDerivativeControlLoader = makeLoader(ARB_derivative_control, "", "gl45");
static if(!usingContexts) enum arbDerivativeControl = arbDerivativeControlLoader;

// ARB_direct_state_access <-- Core in GL 4.5
enum ARB_direct_state_access = "GL_ARB_direct_state_access";
enum arbDirectStateAccessDecls =
q{
enum : uint
{
    GL_TEXTURE_TARGET = 0x1006,
    GL_QUERY_TARGET = 0x82EA,
}
extern(System) @nogc nothrow
{
    alias da_glCreateTransformFeedbacks = void function(GLsizei,GLuint*);
    alias da_glTransformFeedbackBufferBase = void function(GLsizei,GLuint,GLuint);
    alias da_glTransformFeedbackBufferRange = void function(GLuint,GLuint,GLuint,GLintptr,GLsizei);
    alias da_glGetTransformFeedbackiv = void function(GLuint,GLenum,GLint*);
    alias da_glGetTransformFeedbacki_v = void function(GLuint,GLenum,GLuint,GLint*);
    alias da_glGetTransformFeedbacki64_v = void function(GLuint,GLenum,GLuint,GLint64*);
    alias da_glCreateBuffers = void function(GLsizei,GLuint*);
    alias da_glNamedBufferStorage = void function(GLuint,GLsizeiptr,const(void)*,GLbitfield);
    alias da_glNamedBufferData = void function(GLuint,GLsizeiptr,const(void)*,GLenum);
    alias da_glNamedBufferSubData = void function(GLuint,GLintptr,GLsizeiptr,const(void)*);
    alias da_glCopyNamedBufferSubData = void function(GLuint,GLuint,GLintptr,GLintptr,GLsizeiptr);
    alias da_glClearNamedBufferData = void function(GLuint,GLenum,GLenum,GLenum,const(void)*);
    alias da_glClearNamedBufferSubData = void function(GLuint,GLenum,GLintptr,GLsizeiptr,GLenum,GLenum,const(void)*);
    alias da_glMapNamedBuffer = void* function(GLuint,GLenum);
    alias da_glMapNamedBufferRange = void* function(GLuint,GLintptr,GLsizeiptr,GLbitfield);
    alias da_glUnmapNamedBuffer = GLboolean function(GLuint);
    alias da_glFlushMappedNamedBufferRange = void function(GLuint,GLintptr,GLsizeiptr);
    alias da_glGetNamedBufferParameteriv = void function(GLuint,GLenum,GLint*);
    alias da_glGetNamedBufferParameteri64v = void function(GLuint,GLenum,GLint64*);
    alias da_glGetNamedBufferPointerv = void function(GLuint,GLenum,void**);
    alias da_glGetNamedBufferSubData = void function(GLuint,GLintptr,GLsizeiptr,void*);
    alias da_glCreateFramebuffers = void function(GLsizei,GLuint*);
    alias da_glNamedFramebufferRenderbuffer = void function(GLuint,GLenum,GLenum,GLuint);
    alias da_glNamedFramebufferParameteri = void function(GLuint,GLenum,GLint);
    alias da_glNamedFramebufferTexture = void function(GLuint,GLenum,GLuint,GLint);
    alias da_glNamedFramebufferTextureLayer = void function(GLuint,GLenum,GLuint,GLint,GLint);
    alias da_glNamedFramebufferDrawBuffer = void function(GLuint,GLenum);
    alias da_glNamedFramebufferDrawBuffers = void function(GLuint,GLsizei,const(GLenum)*);
    alias da_glNamedFramebufferReadBuffer = void function(GLuint,GLenum);
    alias da_glInvalidateNamedFramebufferData = void function(GLuint,GLsizei,const(GLenum)*);
    alias da_glInvalidateNamedFramebufferSubData = void function(GLuint,GLsizei,const(GLenum)*,GLint,GLint,GLsizei,GLsizei);
    alias da_glClearNamedFramebufferiv = void function(GLuint,GLenum,GLint,const(GLint)*);
    alias da_glClearNamedFramebufferuiv = void function(GLuint,GLenum,GLint,const(GLuint)*);
    alias da_glClearNamedFramebufferfv = void function(GLuint,GLenum,GLint,const(GLfloat)*);
    alias da_glClearNamedFramebufferfi = void function(GLuint,GLenum,GLfloat,GLint);
    alias da_glBlitNamedFramebuffer = void function(GLuint,GLuint,GLint,GLint,GLint,GLint,GLint,GLint,GLint,GLint,GLbitfield,GLenum);
    alias da_glCheckNamedFramebufferStatus = GLenum function(GLuint,GLenum);
    alias da_glGetNamedFramebufferParameteriv = void function(GLuint,GLenum,GLint*);
    alias da_glGetNamedFramebufferAttachmentParameteriv = void function(GLuint,GLenum,GLenum,GLint*);
    alias da_glCreateRenderbuffers = void function(GLsizei,GLuint*);
    alias da_glNamedRenderbufferStorage = void function(GLuint,GLenum,GLsizei,GLsizei);
    alias da_glNamedRenderbufferStorageMultisample = void function(GLuint,GLsizei,GLenum,GLsizei,GLsizei);
    alias da_glGetNamedRenderbufferParameteriv = void function(GLuint,GLenum,GLint*);
    alias da_glCreateTextures = void function(GLenum,GLsizei,GLuint*);
    alias da_glTextureBuffer = void function(GLuint,GLenum,GLuint);
    alias da_glTextureBufferRange = void function(GLuint,GLenum,GLuint,GLintptr,GLsizeiptr);
    alias da_glTextureStorage1D = void function(GLuint,GLsizei,GLenum,GLsizei);
    alias da_glTextureStorage2D = void function(GLuint,GLsizei,GLenum,GLsizei,GLsizei);
    alias da_glTextureStorage3D = void function(GLuint,GLsizei,GLenum,GLsizei,GLsizei,GLsizei);
    alias da_glTextureStorage2DMultisample = void function(GLuint,GLsizei,GLenum,GLsizei,GLsizei,GLboolean);
    alias da_glTextureStorage3DMultisample = void function(GLuint,GLsizei,GLenum,GLsizei,GLsizei,GLsizei,GLboolean);
    alias da_glTextureSubImage1D = void function(GLuint,GLint,GLint,GLsizei,GLenum,GLenum,const(void)*);
    alias da_glTextureSubImage2D = void function(GLuint,GLint,GLint,GLint,GLsizei,GLsizei,GLenum,GLenum,const(void)*);
    alias da_glTextureSubImage3D = void function(GLuint,GLint,GLint,GLint,GLint,GLsizei,GLsizei,GLsizei,GLenum,GLenum,const(void)*);
    alias da_glCompressedTextureSubImage1D = void function(GLuint,GLint,GLint,GLsizei,GLenum,GLsizei,const(void)*);
    alias da_glCompressedTextureSubImage2D = void function(GLuint,GLint,GLint,GLint,GLsizei,GLsizei,GLenum,GLsizei,const(void)*);
    alias da_glCompressedTextureSubImage3D = void function(GLuint,GLint,GLint,GLint,GLint,GLsizei,GLsizei,GLsizei,GLenum,GLsizei,const(void)*);
    alias da_glCopyTextureSubImage1D = void function(GLuint,GLint,GLint,GLint,GLint,GLsizei);
    alias da_glCopyTextureSubImage2D = void function(GLuint,GLint,GLint,GLint,GLint,GLint,GLsizei,GLsizei);
    alias da_glCopyTextureSubImage3D = void function(GLuint,GLint,GLint,GLint,GLint,GLint,GLint,GLsizei,GLsizei,GLsizei);
    alias da_glTextureParameterf = void function(GLuint,GLenum,GLfloat);
    alias da_glTextureParameterfv = void function(GLuint,GLenum,const(GLfloat)*);
    alias da_glTextureParameteri = void function(GLuint,GLenum,GLint);
    alias da_glTextureParameterIiv = void function(GLuint,GLenum,const(GLint)*);
    alias da_glTextureParameterIuiv = void function(GLuint,GLenum,const(GLuint)*);
    alias da_glTextureParameteriv = void function(GLuint,GLenum,const(GLint)*);
    alias da_glGenerateTextureMipmap = void function(GLuint);
    alias da_glBindTextureUnit = void function(GLuint,GLuint);
    alias da_glGetTextureImage = void function(GLuint,GLint,GLenum,GLenum,GLsizei,void*);
    alias da_glGetCompressedTextureImage = void function(GLuint,GLint,GLsizei,void*);
    alias da_glGetTextureLevelParameterfv = void function(GLuint,GLint,GLenum,GLfloat*);
    alias da_glGetTextureLevelParameteriv = void function(GLuint,GLint,GLenum,GLint*);
    alias da_glGetTextureParameterfv = void function(GLuint,GLenum,GLfloat*);
    alias da_glGetTextureParameterIiv = void function(GLuint,GLenum,GLint*);
    alias da_glGetTextureParameterIuiv = void function(GLuint,GLenum,GLuint*);
    alias da_glGetTextureParameteriv = void function(GLuint,GLenum,GLint*);
    alias da_glCreateVertexArrays = void function(GLsizei,GLuint*);
    alias da_glDisableVertexArrayAttrib = void function(GLuint,GLuint);
    alias da_glEnableVertexArrayAttrib = void function(GLuint,GLuint);
    alias da_glVertexArrayElementBuffer = void function(GLuint,GLuint);
    alias da_glVertexArrayVertexBuffer = void function(GLuint,GLuint,GLuint,GLintptr,GLsizei);
    alias da_glVertexArrayVertexBuffers = void function(GLuint,GLuint,GLsizei,const(GLuint)*,const(GLintptr)*,const(GLsizei)*);
    alias da_glVertexArrayAttribFormat = void function(GLuint,GLuint,GLint,GLenum,GLboolean,GLuint);
    alias da_glVertexArrayAttribIFormat = void function(GLuint,GLuint,GLint,GLenum,GLuint);
    alias da_glVertexArrayAttribLFormat = void function(GLuint,GLuint,GLint,GLenum,GLuint);
    alias da_glVertexArrayAttribBinding = void function(GLuint,GLuint,GLuint);
    alias da_glVertexArrayBindingDivisor = void function(GLuint,GLuint,GLuint);
    alias da_glGetVertexArrayiv = void function(GLuint,GLenum,GLint*);
    alias da_glGetVertexArrayIndexediv = void function(GLuint,GLuint,GLenum,GLint*);
    alias da_glGetVertexArrayIndexed64iv = void function(GLuint,GLuint,GLenum,GLint64*);
    alias da_glCreateSamplers = void function(GLsizei,GLuint*);
    alias da_glCreateProgramPipelines = void function(GLsizei,GLuint*);
    alias da_glCreateQueries = void function(GLenum,GLsizei,GLuint*);
    alias da_glGetQueryBufferObjectiv = void function(GLuint,GLuint,GLenum,GLintptr);
    alias da_glGetQueryBufferObjectuiv = void function(GLuint,GLuint,GLenum,GLintptr);
    alias da_glGetQueryBufferObjecti64v = void function(GLuint,GLuint,GLenum,GLintptr);
    alias da_glGetQueryBufferObjectui64v = void function(GLuint,GLuint,GLenum,GLintptr);
}};

enum arbDirectStateAccessFuncs =
q{
    da_glCreateTransformFeedbacks glCreateTransformFeedbacks;
    da_glTransformFeedbackBufferBase glTransformFeedbackBufferBase;
    da_glTransformFeedbackBufferRange glTransformFeedbackBufferRange;
    da_glGetTransformFeedbackiv glGetTransformFeedbackiv;
    da_glGetTransformFeedbacki_v glGetTransformFeedbacki_v;
    da_glGetTransformFeedbacki64_v glGetTransformFeedbacki64_v;
    da_glCreateBuffers glCreateBuffers;
    da_glNamedBufferStorage glNamedBufferStorage;
    da_glNamedBufferData glNamedBufferData;
    da_glNamedBufferSubData glNamedBufferSubData;
    da_glCopyNamedBufferSubData glCopyNamedBufferSubData;
    da_glClearNamedBufferData glClearNamedBufferData;
    da_glClearNamedBufferSubData glClearNamedBufferSubData;
    da_glMapNamedBuffer glMapNamedBuffer;
    da_glMapNamedBufferRange glMapNamedBufferRange;
    da_glUnmapNamedBuffer glUnmapNamedBuffer;
    da_glFlushMappedNamedBufferRange glFlushMappedNamedBufferRange;
    da_glGetNamedBufferParameteriv glGetNamedBufferParameteriv;
    da_glGetNamedBufferParameteri64v glGetNamedBufferParameteri64v;
    da_glGetNamedBufferPointerv glGetNamedBufferPointerv;
    da_glGetNamedBufferSubData glGetNamedBufferSubData;
    da_glCreateFramebuffers glCreateFramebuffers;
    da_glNamedFramebufferRenderbuffer glNamedFramebufferRenderbuffer;
    da_glNamedFramebufferParameteri glNamedFramebufferParameteri;
    da_glNamedFramebufferTexture glNamedFramebufferTexture;
    da_glNamedFramebufferTextureLayer glNamedFramebufferTextureLayer;
    da_glNamedFramebufferDrawBuffer glNamedFramebufferDrawBuffer;
    da_glNamedFramebufferDrawBuffers glNamedFramebufferDrawBuffers;
    da_glNamedFramebufferReadBuffer glNamedFramebufferReadBuffer;
    da_glInvalidateNamedFramebufferData glInvalidateNamedFramebufferData;
    da_glInvalidateNamedFramebufferSubData glInvalidateNamedFramebufferSubData;
    da_glClearNamedFramebufferiv glClearNamedFramebufferiv;
    da_glClearNamedFramebufferuiv glClearNamedFramebufferuiv;
    da_glClearNamedFramebufferfv glClearNamedFramebufferfv;
    da_glClearNamedFramebufferfi glClearNamedFramebufferfi;
    da_glBlitNamedFramebuffer glBlitNamedFramebuffer;
    da_glCheckNamedFramebufferStatus glCheckNamedFramebufferStatus;
    da_glGetNamedFramebufferParameteriv glGetNamedFramebufferParameteriv;
    da_glGetNamedFramebufferAttachmentParameteriv glGetNamedFramebufferAttachmentParameteriv;
    da_glCreateRenderbuffers glCreateRenderbuffers;
    da_glNamedRenderbufferStorage glNamedRenderbufferStorage;
    da_glNamedRenderbufferStorageMultisample glNamedRenderbufferStorageMultisample;
    da_glGetNamedRenderbufferParameteriv glGetNamedRenderbufferParameteriv;
    da_glCreateTextures glCreateTextures;
    da_glTextureBuffer glTextureBuffer;
    da_glTextureBufferRange glTextureBufferRange;
    da_glTextureStorage1D glTextureStorage1D;
    da_glTextureStorage2D glTextureStorage2D;
    da_glTextureStorage3D glTextureStorage3D;
    da_glTextureStorage2DMultisample glTextureStorage2DMultisample;
    da_glTextureStorage3DMultisample glTextureStorage3DMultisample;
    da_glTextureSubImage1D glTextureSubImage1D;
    da_glTextureSubImage2D glTextureSubImage2D;
    da_glTextureSubImage3D glTextureSubImage3D;
    da_glCompressedTextureSubImage1D glCompressedTextureSubImage1D;
    da_glCompressedTextureSubImage2D glCompressedTextureSubImage2D;
    da_glCompressedTextureSubImage3D glCompressedTextureSubImage3D;
    da_glCopyTextureSubImage1D glCopyTextureSubImage1D;
    da_glCopyTextureSubImage2D glCopyTextureSubImage2D;
    da_glCopyTextureSubImage3D glCopyTextureSubImage3D;
    da_glTextureParameterf glTextureParameterf;
    da_glTextureParameterfv glTextureParameterfv;
    da_glTextureParameteri glTextureParameteri;
    da_glTextureParameterIiv glTextureParameterIiv;
    da_glTextureParameterIuiv glTextureParameterIuiv;
    da_glTextureParameteriv glTextureParameteriv;
    da_glGenerateTextureMipmap glGenerateTextureMipmap;
    da_glBindTextureUnit glBindTextureUnit;
    da_glGetTextureImage glGetTextureImage;
    da_glGetCompressedTextureImage glGetCompressedTextureImage;
    da_glGetTextureLevelParameterfv glGetTextureLevelParameterfv;
    da_glGetTextureLevelParameteriv glGetTextureLevelParameteriv;
    da_glGetTextureParameterfv glGetTextureParameterfv;
    da_glGetTextureParameterIiv glGetTextureParameterIiv;
    da_glGetTextureParameterIuiv glGetTextureParameterIuiv;
    da_glGetTextureParameteriv glGetTextureParameteriv;
    da_glCreateVertexArrays glCreateVertexArrays;
    da_glDisableVertexArrayAttrib glDisableVertexArrayAttrib;
    da_glEnableVertexArrayAttrib glEnableVertexArrayAttrib;
    da_glVertexArrayElementBuffer glVertexArrayElementBuffer;
    da_glVertexArrayVertexBuffer glVertexArrayVertexBuffer;
    da_glVertexArrayVertexBuffers glVertexArrayVertexBuffers;
    da_glVertexArrayAttribBinding glVertexArrayAttribBinding;
    da_glVertexArrayAttribFormat glVertexArrayAttribFormat;
    da_glVertexArrayAttribIFormat glVertexArrayAttribIFormat;
    da_glVertexArrayAttribLFormat glVertexArrayAttribLFormat;
    da_glVertexArrayBindingDivisor glVertexArrayBindingDivisor;
    da_glGetVertexArrayiv glGetVertexArrayiv;
    da_glGetVertexArrayIndexediv glGetVertexArrayIndexediv;
    da_glGetVertexArrayIndexed64iv glGetVertexArrayIndexed64iv;
    da_glCreateSamplers glCreateSamplers;
    da_glCreateProgramPipelines glCreateProgramPipelines;
    da_glCreateQueries glCreateQueries;
    da_glGetQueryBufferObjecti64v glGetQueryBufferObjecti64v;
    da_glGetQueryBufferObjectiv glGetQueryBufferObjectiv;
    da_glGetQueryBufferObjectui64v glGetQueryBufferObjectui64v;
    da_glGetQueryBufferObjectuiv glGetQueryBufferObjectuiv;
};

enum arbDirectStateAccessLoaderImpl =
q{
    bindGLFunc(cast(void**)&glCreateTransformFeedbacks, "glCreateTransformFeedbacks");
    bindGLFunc(cast(void**)&glTransformFeedbackBufferBase, "glTransformFeedbackBufferBase");
    bindGLFunc(cast(void**)&glTransformFeedbackBufferRange, "glTransformFeedbackBufferRange");
    bindGLFunc(cast(void**)&glGetTransformFeedbackiv, "glGetTransformFeedbackiv");
    bindGLFunc(cast(void**)&glGetTransformFeedbacki_v, "glGetTransformFeedbacki_v");
    bindGLFunc(cast(void**)&glGetTransformFeedbacki64_v, "glGetTransformFeedbacki64_v");
    bindGLFunc(cast(void**)&glCreateBuffers, "glCreateBuffers");
    bindGLFunc(cast(void**)&glNamedBufferStorage, "glNamedBufferStorage");
    bindGLFunc(cast(void**)&glNamedBufferData, "glNamedBufferData");
    bindGLFunc(cast(void**)&glNamedBufferSubData, "glNamedBufferSubData");
    bindGLFunc(cast(void**)&glCopyNamedBufferSubData, "glCopyNamedBufferSubData");
    bindGLFunc(cast(void**)&glClearNamedBufferData, "glClearNamedBufferData");
    bindGLFunc(cast(void**)&glClearNamedBufferSubData, "glClearNamedBufferSubData");
    bindGLFunc(cast(void**)&glMapNamedBuffer, "glMapNamedBuffer");
    bindGLFunc(cast(void**)&glMapNamedBufferRange, "glMapNamedBufferRange");
    bindGLFunc(cast(void**)&glUnmapNamedBuffer, "glUnmapNamedBuffer");
    bindGLFunc(cast(void**)&glFlushMappedNamedBufferRange, "glFlushMappedNamedBufferRange");
    bindGLFunc(cast(void**)&glGetNamedBufferParameteriv, "glGetNamedBufferParameteriv");
    bindGLFunc(cast(void**)&glGetNamedBufferParameteri64v, "glGetNamedBufferParameteri64v");
    bindGLFunc(cast(void**)&glGetNamedBufferPointerv, "glGetNamedBufferPointerv");
    bindGLFunc(cast(void**)&glGetNamedBufferSubData, "glGetNamedBufferSubData");
    bindGLFunc(cast(void**)&glCreateFramebuffers, "glCreateFramebuffers");
    bindGLFunc(cast(void**)&glNamedFramebufferRenderbuffer, "glNamedFramebufferRenderbuffer");
    bindGLFunc(cast(void**)&glNamedFramebufferParameteri, "glNamedFramebufferParameteri");
    bindGLFunc(cast(void**)&glNamedFramebufferTexture, "glNamedFramebufferTexture");
    bindGLFunc(cast(void**)&glNamedFramebufferTextureLayer, "glNamedFramebufferTextureLayer");
    bindGLFunc(cast(void**)&glNamedFramebufferDrawBuffer, "glNamedFramebufferDrawBuffer");
    bindGLFunc(cast(void**)&glNamedFramebufferDrawBuffers, "glNamedFramebufferDrawBuffers");
    bindGLFunc(cast(void**)&glNamedFramebufferReadBuffer, "glNamedFramebufferReadBuffer");
    bindGLFunc(cast(void**)&glInvalidateNamedFramebufferData, "glInvalidateNamedFramebufferData");
    bindGLFunc(cast(void**)&glInvalidateNamedFramebufferSubData, "glInvalidateNamedFramebufferSubData");
    bindGLFunc(cast(void**)&glClearNamedFramebufferiv, "glClearNamedFramebufferiv");
    bindGLFunc(cast(void**)&glClearNamedFramebufferuiv, "glClearNamedFramebufferuiv");
    bindGLFunc(cast(void**)&glClearNamedFramebufferfv, "glClearNamedFramebufferfv");
    bindGLFunc(cast(void**)&glClearNamedFramebufferfi, "glClearNamedFramebufferfi");
    bindGLFunc(cast(void**)&glBlitNamedFramebuffer, "glBlitNamedFramebuffer");
    bindGLFunc(cast(void**)&glCheckNamedFramebufferStatus, "glCheckNamedFramebufferStatus");
    bindGLFunc(cast(void**)&glGetNamedFramebufferParameteriv, "glGetNamedFramebufferParameteriv");
    bindGLFunc(cast(void**)&glGetNamedFramebufferAttachmentParameteriv, "glGetNamedFramebufferAttachmentParameteriv");
    bindGLFunc(cast(void**)&glCreateRenderbuffers, "glCreateRenderbuffers");
    bindGLFunc(cast(void**)&glNamedRenderbufferStorage, "glNamedRenderbufferStorage");
    bindGLFunc(cast(void**)&glNamedRenderbufferStorageMultisample, "glNamedRenderbufferStorageMultisample");
    bindGLFunc(cast(void**)&glGetNamedRenderbufferParameteriv, "glGetNamedRenderbufferParameteriv");
    bindGLFunc(cast(void**)&glCreateTextures, "glCreateTextures");
    bindGLFunc(cast(void**)&glTextureBuffer, "glTextureBuffer");
    bindGLFunc(cast(void**)&glTextureBufferRange, "glTextureBufferRange");
    bindGLFunc(cast(void**)&glTextureStorage1D, "glTextureStorage1D");
    bindGLFunc(cast(void**)&glTextureStorage2D, "glTextureStorage2D");
    bindGLFunc(cast(void**)&glTextureStorage3D, "glTextureStorage3D");
    bindGLFunc(cast(void**)&glTextureStorage2DMultisample, "glTextureStorage2DMultisample");
    bindGLFunc(cast(void**)&glTextureStorage3DMultisample, "glTextureStorage3DMultisample");
    bindGLFunc(cast(void**)&glTextureSubImage1D, "glTextureSubImage1D");
    bindGLFunc(cast(void**)&glTextureSubImage2D, "glTextureSubImage2D");
    bindGLFunc(cast(void**)&glTextureSubImage3D, "glTextureSubImage3D");
    bindGLFunc(cast(void**)&glCompressedTextureSubImage1D, "glCompressedTextureSubImage1D");
    bindGLFunc(cast(void**)&glCompressedTextureSubImage2D, "glCompressedTextureSubImage2D");
    bindGLFunc(cast(void**)&glCompressedTextureSubImage3D, "glCompressedTextureSubImage3D");
    bindGLFunc(cast(void**)&glCopyTextureSubImage1D, "glCopyTextureSubImage1D");
    bindGLFunc(cast(void**)&glCopyTextureSubImage2D, "glCopyTextureSubImage2D");
    bindGLFunc(cast(void**)&glCopyTextureSubImage3D, "glCopyTextureSubImage3D");
    bindGLFunc(cast(void**)&glTextureParameterf, "glTextureParameterf");
    bindGLFunc(cast(void**)&glTextureParameterfv, "glTextureParameterfv");
    bindGLFunc(cast(void**)&glTextureParameteri, "glTextureParameteri");
    bindGLFunc(cast(void**)&glTextureParameterIiv, "glTextureParameterIiv");
    bindGLFunc(cast(void**)&glTextureParameterIuiv, "glTextureParameterIuiv");
    bindGLFunc(cast(void**)&glTextureParameteriv, "glTextureParameteriv");
    bindGLFunc(cast(void**)&glGenerateTextureMipmap, "glGenerateTextureMipmap");
    bindGLFunc(cast(void**)&glBindTextureUnit, "glBindTextureUnit");
    bindGLFunc(cast(void**)&glGetTextureImage, "glGetTextureImage");
    bindGLFunc(cast(void**)&glGetCompressedTextureImage, "glGetCompressedTextureImage");
    bindGLFunc(cast(void**)&glGetTextureLevelParameterfv, "glGetTextureLevelParameterfv");
    bindGLFunc(cast(void**)&glGetTextureLevelParameteriv, "glGetTextureLevelParameteriv");
    bindGLFunc(cast(void**)&glGetTextureParameterfv, "glGetTextureParameterfv");
    bindGLFunc(cast(void**)&glGetTextureParameterIiv, "glGetTextureParameterIiv");
    bindGLFunc(cast(void**)&glGetTextureParameterIuiv, "glGetTextureParameterIuiv");
    bindGLFunc(cast(void**)&glGetTextureParameteriv, "glGetTextureParameteriv");
    bindGLFunc(cast(void**)&glCreateVertexArrays, "glCreateVertexArrays");
    bindGLFunc(cast(void**)&glDisableVertexArrayAttrib, "glDisableVertexArrayAttrib");
    bindGLFunc(cast(void**)&glEnableVertexArrayAttrib, "glEnableVertexArrayAttrib");
    bindGLFunc(cast(void**)&glVertexArrayElementBuffer, "glVertexArrayElementBuffer");
    bindGLFunc(cast(void**)&glVertexArrayVertexBuffer, "glVertexArrayVertexBuffer");
    bindGLFunc(cast(void**)&glVertexArrayVertexBuffers, "glVertexArrayVertexBuffers");
    bindGLFunc(cast(void**)&glVertexArrayAttribBinding, "glVertexArrayAttribBinding");
    bindGLFunc(cast(void**)&glVertexArrayAttribFormat, "glVertexArrayAttribFormat");
    bindGLFunc(cast(void**)&glVertexArrayAttribIFormat, "glVertexArrayAttribIFormat");
    bindGLFunc(cast(void**)&glVertexArrayAttribLFormat, "glVertexArrayAttribLFormat");
    bindGLFunc(cast(void**)&glVertexArrayBindingDivisor, "glVertexArrayBindingDivisor");
    bindGLFunc(cast(void**)&glGetVertexArrayiv, "glGetVertexArrayiv");
    bindGLFunc(cast(void**)&glGetVertexArrayIndexediv, "glGetVertexArrayIndexediv");
    bindGLFunc(cast(void**)&glGetVertexArrayIndexed64iv, "glGetVertexArrayIndexed64iv");
    bindGLFunc(cast(void**)&glCreateSamplers, "glCreateSamplers");
    bindGLFunc(cast(void**)&glCreateProgramPipelines, "glCreateProgramPipelines");
    bindGLFunc(cast(void**)&glCreateQueries, "glCreateQueries");
    bindGLFunc(cast(void**)&glGetQueryBufferObjecti64v, "glGetQueryBufferObjecti64v");
    bindGLFunc(cast(void**)&glGetQueryBufferObjectiv, "glGetQueryBufferObjectiv");
    bindGLFunc(cast(void**)&glGetQueryBufferObjectui64v, "glGetQueryBufferObjectui64v");
    bindGLFunc(cast(void**)&glGetQueryBufferObjectuiv, "glGetQueryBufferObjectuiv");
};

enum arbDirectStateAccessLoader = makeLoader(ARB_direct_state_access, arbDirectStateAccessLoaderImpl, "gl45");
static if(!usingContexts) enum arbDirectStateAccess = arbDirectStateAccessDecls ~ arbDirectStateAccessFuncs.makeGShared() ~ arbDirectStateAccessLoader;

// ARB_draw_buffers_blend <-- Core in GL 4.0
enum ARB_draw_buffers_blend = "GL_ARB_draw_buffers_blend";
enum arbDrawBuffersBlendDecls =
q{
extern(System) @nogc nothrow {
    alias da_glBlendEquationiARB = void function(GLuint, GLenum);
    alias da_glBlendEquationSeparateiARB = void function(GLuint, GLenum, GLenum);
    alias da_glBlendFunciARB = void function(GLuint, GLenum, GLenum);
    alias da_glBlendFuncSeparateiARB = void function(GLuint, GLenum, GLenum, GLenum, GLenum);
}};

enum arbDrawBuffersBlendFuncs =
q{
    da_glBlendEquationiARB glBlendEquationiARB;
    da_glBlendEquationSeparateiARB glBlendEquationSeparateiARB;
    da_glBlendFunciARB glBlendFunciARB;
    da_glBlendFuncSeparateiARB glBlendFuncSeparateiARB;
};

enum arbDrawBuffersBlendLoaderImpl =
q{
    bindGLFunc(cast(void**)&glBlendEquationiARB, "glBlendEquationiARB");
    bindGLFunc(cast(void**)&glBlendEquationSeparateiARB, "glBlendEquationSeparateiARB");
    bindGLFunc(cast(void**)&glBlendFunciARB, "glBlendFunciARB");
    bindGLFunc(cast(void**)&glBlendFuncSeparateiARB, "glBlendFuncSeparateiARB");
};

enum arbDrawBuffersBlendLoader = makeLoader(ARB_draw_buffers_blend, arbDrawBuffersBlendLoaderImpl, "gl40");
static if(!usingContexts) enum arbDrawBuffersBlend = arbDrawBuffersBlendDecls ~ arbDrawBuffersBlendFuncs.makeGShared() ~ arbDrawBuffersBlendLoader;

// ARB_draw_elements_base_vertex <-- Core in GL 3.2
enum ARB_draw_elements_base_vertex = "GL_ARB_draw_elements_base_vertex";
enum arbDrawElementsBaseVertexDecls =
q{

extern(System) @nogc nothrow {
    alias da_glDrawElementsBaseVertex = void function(GLenum, GLsizei, GLenum, const(GLvoid)*, GLint);
    alias da_glDrawRangeElementsBaseVertex = void function(GLenum, GLuint, GLuint, GLsizei, GLenum, const(GLvoid)*, GLint);
    alias da_glDrawElementsInstancedBaseVertex = void function(GLenum, GLsizei, GLenum, const(GLvoid)*, GLsizei, GLint);
    alias da_glMultiDrawElementsBaseVertex = void function(GLenum, const(GLsizei)*, GLenum, const(GLvoid*)*, GLsizei, const(GLint)*);
}};

enum arbDrawElementsBaseVertexFuncs =
q{
    da_glDrawElementsBaseVertex glDrawElementsBaseVertex;
    da_glDrawRangeElementsBaseVertex glDrawRangeElementsBaseVertex;
    da_glDrawElementsInstancedBaseVertex glDrawElementsInstancedBaseVertex;
    da_glMultiDrawElementsBaseVertex glMultiDrawElementsBaseVertex;
};

enum arbDrawElementsBaseVertexLoaderImpl =
q{
    bindGLFunc(cast(void**)&glDrawElementsBaseVertex, "glDrawElementsBaseVertex");
    bindGLFunc(cast(void**)&glDrawRangeElementsBaseVertex, "glDrawRangeElementsBaseVertex");
    bindGLFunc(cast(void**)&glDrawElementsInstancedBaseVertex, "glDrawElementsInstancedBaseVertex");
    bindGLFunc(cast(void**)&glMultiDrawElementsBaseVertex, "glMultiDrawElementsBaseVertex");
};

enum arbDrawElementsBaseVertexLoader = makeLoader(ARB_draw_elements_base_vertex, arbDrawElementsBaseVertexLoaderImpl, "gl32");
static if(!usingContexts) enum arbDrawElementsBaseVertex = arbDrawElementsBaseVertexDecls ~ arbDrawElementsBaseVertexFuncs.makeGShared() ~ arbDrawElementsBaseVertexLoader;

// ARB_draw_indirect <-- Core in GL 4.0
enum ARB_draw_indirect = "GL_ARB_draw_indirect";
enum arbDrawIndirectDecls =
q{
enum : uint
{
    GL_DRAW_INDIRECT_BUFFER           = 0x8F3F,
    GL_DRAW_INDIRECT_BUFFER_BINDING   = 0x8F43,
}
extern(System) @nogc nothrow {
    alias da_glDrawArraysIndirect = void function(GLenum, const(GLvoid)*);
    alias da_glDrawElementsIndirect = void function(GLenum, GLenum, const(GLvoid)*);
}};

enum arbDrawIndirectFuncs =
q{
    da_glDrawArraysIndirect glDrawArraysIndirect;
    da_glDrawElementsIndirect glDrawElementsIndirect;
};

enum arbDrawIndirectLoaderImpl =
q{
    bindGLFunc(cast(void**)&glDrawArraysIndirect, "glDrawArraysIndirect");
    bindGLFunc(cast(void**)&glDrawElementsIndirect, "glDrawElementsIndirect");
};

enum arbDrawIndirectLoader = makeLoader(ARB_draw_indirect, arbDrawIndirectLoaderImpl, "gl40");
static if(!usingContexts) enum arbDrawIndirect = arbDrawIndirectDecls ~ arbDrawIndirectFuncs.makeGShared() ~ arbDrawIndirectLoader;
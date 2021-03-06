DerelictGL3
===========

_Note that the information here applies to version 1.0 of DerelictGL3 and is not accurate for the 2.0 branch. It will be updated with the correct information when the documentation is complete._

A dynamic binding to OpenGL for the D Programming Language.

Please see the sections on [Compiling and Linking][1] and [The Derelict Loader][2], in the Derelict documentation, for information on how to build DerelictGL3. DerelictGL3 differs from the other Derelict packages in that there is a two-step load process which is used to mask some platform differences in how the graphics drivers are managed. Everything in the section [The Derelict Loader][2] in the Derelict documentation still applies. The difference is that `DerelictGL3.load()`, unlike its behavior in the other bindings, does not load the entire library; it only loads the functions for OpenGL versions 1.0 and 1.1. Once a context has been created, `DerelictGL3.reload()` should be called. This will load all available versions 1.2+ and all supported ARB and EXT extensions. `reload` should also be called any time the OpenGL context is switched. The `load` method can be called before or after creating a context, but should always be called before `reload` and does not need to be called on a context switch.

Using the DerelictGL3 loader will only load core OpenGL functions and will not load any of the deprecated API. Here's some sample code.

```D
// For core API functions.
import derelict.opengl3.gl3;

void main() {
    // Load OpenGL versions 1.0 and 1.1.
    DerelictGL3.load();

    // Create an OpenGL context with another library (like SDL 2 or GLFW 3)
    ...

    // Load versions 1.2+ and all supported ARB and EXT extensions.
    DerelictGL3.reload();

    // Now OpenGL functions can be called.
    ...
}
```

To make use of the deprecated OpenGL API, the same steps can be followed, but using the DerelictGL loader instead of DerelictGL3. Note that you do not need to import `derelict.opengl3.gl3` when using the DerelictGL loader. The `derelict.opengl3.gl` module publicly imports all of the non-deprecated functions and types as well as the deprecated ones.
```D
// For core *and* deprecated API functions.
import derelict.opengl3.gl;

void main() {
    // Load OpenGL versions 1.0 and 1.1.
    DerelictGL.load();

    // Create an OpenGL context with another library (like SDL 2 or GLFW 3)
    ...

    // Load versions 1.2+ and all supported ARB and EXT extensions.
    DerelictGL.reload();

    // Now OpenGL functions can be called.
    ...
}
```

In both cases, the `reload` method will attempt to load the highest OpenGL version supported by the active context. It will return a value of the type `GLVersion</tt> indicating which version was actually loaded. This can also be queried at any time via the `loadedVersion` property of both loaders.

Valid values for `GLVersion` can be found in the module [derelict.opengl3.types][3].

[1]: http://derelictorg.github.io/building/overview/
[2]: http://derelictorg.github.io/loading/loader/
[3]: https://github.com/DerelictOrg/DerelictGL3/blob/master/source/derelict/opengl3/types.d#L89

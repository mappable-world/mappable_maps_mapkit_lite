package world.mappable.maps.flutter.view

import world.mappable.runtime.view.internal.PlatformGLRenderer
import world.mappable.runtime.view.internal.RenderDelegate
import javax.microedition.khronos.opengles.GL10

class ViewRenderer(renderDelegate: RenderDelegate) : PlatformGLRenderer(renderDelegate) {
    private var isInitialize = false

    override fun onDrawFrame(gl: GL10?) {
        if (isInitialize) {
            super.onDrawFrame(gl)
        }
    }

    fun init() {
        isInitialize = true
    }
}

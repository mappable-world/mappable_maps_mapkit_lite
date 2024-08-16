package world.mappable.maps.flutter

import android.util.Log
import androidx.annotation.NonNull
import world.mappable.maps.flutter.method_handler.BaseMethodHandler
import world.mappable.maps.flutter.method_handler.RuntimeHandler
import world.mappable.maps.flutter.method_handler.ViewMethodHandler
import world.mappable.maps.flutter.view.ViewFactory

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** MappableMapsPlugin */
class MappableMapsPlugin : FlutterPlugin, ActivityAware {
    private val handlers = mutableListOf<BaseMethodHandler>()
    private val lifecycle = ActivityLifecycleWrapper()


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val viewFactory = ViewFactory(lifecycle)
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "flutter_mappable_maps_view_factory",
            viewFactory
        )

        handlers.add(RuntimeHandler(flutterPluginBinding))
        handlers.add(ViewMethodHandler(flutterPluginBinding, viewFactory))
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        for (handler in handlers) {
            handler.dispose()
        }
        handlers.clear()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        lifecycle.onAttachedToActivity(binding)

        handlers.forEach(BaseMethodHandler::start)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        lifecycle.onDetachedFromActivityForConfigChanges()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        lifecycle.onReattachedToActivityForConfigChanges(binding)
    }

    override fun onDetachedFromActivity() {
        lifecycle.onDetachedFromActivity()
    }
}

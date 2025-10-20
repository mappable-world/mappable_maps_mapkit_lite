package world.mappable.maps.flutter

import android.util.Log
import androidx.annotation.NonNull
import world.mappable.maps.flutter.method_handler.BaseMethodHandler
import world.mappable.maps.flutter.method_handler.RuntimeMethodHandler
import world.mappable.maps.flutter.method_handler.ViewMethodHandler
import world.mappable.maps.flutter.view.ViewFactory

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

import world.mappable.runtime.Runtime

/** MappableMapsPlugin */
class MappableMapsPlugin : FlutterPlugin, ActivityAware {
    private val handlers = mutableListOf<BaseMethodHandler>()
    private val lifecycle = ActivityLifecycleWrapper()
    private var engineId: Int? = null

    fun initEngineId(id: Int) {
        if (engineId != null) {
            throw Exception("Double initialization MappableMapsPlugin with id: $engineId, new id: $id")
        }
        Log.d("MappableMapsPlugin", "Init engineId for MappableMapsPlugin: $id")
        engineId = id
    }

    fun tryReinitEngine(): Int? {
        if (engineId == null) {
            return null
        }
        Log.d("MappableMapsPlugin", "Reattach engine")
        Runtime.onDetachedFromEngine(engineId!!)
        return engineId!!
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        Log.d("MappableMapsPlugin", "Attach new plugin to engine")
        Runtime.init(flutterPluginBinding.applicationContext, "maps-mobile")

        val viewFactory = ViewFactory(lifecycle)
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "flutter_mappable_maps_view_factory",
            viewFactory
        )

        handlers.add(ViewMethodHandler(flutterPluginBinding, viewFactory))
        handlers.add(RuntimeMethodHandler(flutterPluginBinding, this))
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        Log.d("MappableMapsPlugin", "Detach plugin from engine with id: $engineId")
        if (engineId != null) {
            Runtime.onDetachedFromEngine(engineId!!)
        }
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

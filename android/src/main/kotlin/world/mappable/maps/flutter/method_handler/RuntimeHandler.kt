package world.mappable.maps.flutter.method_handler

import world.mappable.mapkit.MapKitFactory
import world.mappable.runtime.Runtime
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

import world.mappable.runtime.internal.Scheduler

class RuntimeHandler(private val binding: FlutterPlugin.FlutterPluginBinding) : BaseMethodHandler(binding, "runtime") {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "init" -> initMapkit(call, result)

            else -> result.notImplemented()
        }
    }

    private fun initMapkit(call: MethodCall, result: MethodChannel.Result) {
        val options = call.argument<Map<String, String>>("options") ?: HashMap()
        Runtime.init(binding.applicationContext, "maps-mobile", options)

        result.success(null)
    }
}

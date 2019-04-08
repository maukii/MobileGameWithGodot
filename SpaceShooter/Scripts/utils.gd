# script: utils

extends Node

func _ready():
	pass

func attach(src_node, src_signal, trg_node, trg_func):
	if typeof(src_node) == TYPE_STRING:
		src_node = find_node(src_node)
	
	if typeof(trg_node) == TYPE_STRING:
		trg_node = find_node(trg_node)
	
	if src_node != null and trg_node != null:
		src_node.connect(src_signal, trg_node, trg_func)
	pass

func remote_call(src_node, method, arg0 = null, arg1 = null):
	src_node = find_node(src_node)
	
	if src_node and src_node.has_method(method):
		if arg0 and arg1:
			return src_node.call(method, arg0, arg1)
		if arg0:
			return src_node.call(method, arg0)
		
		return src_node.call(method)
	pass
/*
*
*	Initializing all scripts necessary
*
*/

init(){	
	scripts\baserace\_vanilla::init();
	
	thread scripts\players\_connect::init();
	thread scripts\players\_players::init();
	thread scripts\players\_menus::init();
	thread scripts\baserace\_baserace::init();
}
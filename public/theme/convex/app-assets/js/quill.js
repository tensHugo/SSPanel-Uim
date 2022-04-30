/*=========================================================================================
	File Name: quill.js
	Description: Quill Editor
	----------------------------------------------------------------------------------------
	Item Name: Convex - Bootstrap 4 HTML Admin Dashboard Template
	Version: 1.0
	Author: GeeksLabs
	Author URL: http://www.themeforest.net/user/geekslabs
==========================================================================================*/
(function(window, document, $) {
	'use strict';


	var Font = Quill.import('formats/font');
	Font.whitelist = ['sofia', 'slabo', 'roboto', 'inconsolata', 'ubuntu'];
	Quill.register(Font, true);


	var snowEditor = new Quill('#snow-container .editor', {
		bounds: '#snow-container .editor',
		modules: {
			'formula': true,
			'syntax': true,
			'toolbar': '#snow-container .quill-toolbar'
		},
		theme: 'snow'
	});


	var editors = [bubbleEditor, snowEditor, fullEditor];
	// switchEditor(1, snowEditor, true);

	/*var initialContent = snowEditor.getContents();
	bubbleEditor.setContents(initialContent);
	fullEditor.setContents(initialContent);*/

})(window, document, jQuery);
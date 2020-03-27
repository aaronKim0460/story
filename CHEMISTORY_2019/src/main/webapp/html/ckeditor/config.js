/**
 * @license Copyright (c) 2003-2014, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	//'Paste','PasteText','PasteFromWord'
	
  config.toolbar =[
        ['Source','-','Cut','Copy','Undo','Redo','SelectAll','RemoveFormat'],
        ['Styles','Format','Font','FontSize','TextColor','BGColor','Maximize', 'ShowBlocks'],
        ['Bold','Italic','Underline','Strike', 'Subscript','Superscript'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['NumberedList','BulletedList','Outdent','Indent','Blockquote','CreateDiv'],
        ['Image','Table','HorizontalRule','SpecialChar','PageBreak'],
        ['Link','Unlink','Anchor']
    ];
  
  config.allowedContent = true;
//  config.filebrowserImageUploadUrl = 'upload.jsp?'
    
};

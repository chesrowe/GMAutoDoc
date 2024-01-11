/// @title Primary functions
/// @category API Reference
/// @text Below are the functions you'll use to set up your docs and generate them. 

/// @func tome_add_script(script)
/// @desc adds a script to be parsed when `__tome_generate_docs()` is called
/// @param {asset.GMScript} script The script to add
function tome_add_script(_script){
	var _scriptName = script_get_name(_script);
	var _filePath = __tome_file_project_get_directory() + string("scripts/{0}/{0}.gml", _scriptName, _scriptName);
	array_push(global.__tomeFileArray, _filePath);
}

/// @text ?> When using `tome_add_note()`, only the tags @title and @category are parsed. The rest of the text is displayed as-is.

/// @func tome_add_note(noteName)
/// @desc adds a note to be parsed when `__tome_generate_docs()` is called
/// @param {string} noteName The note to add
function tome_add_note(_noteName){
	var _filePath = __tome_file_project_get_directory() + string("notes/{0}/{0}.txt", _noteName, _noteName);
	array_push(global.__tomeFileArray, _filePath);
}

/// @text ?> When adding a file, if you want Tome to parse the jsdoc tags @func, @desc, @param, and @return, the file must have the extension `.gml`.

/// @func tome_add_file(filePath)
/// @desc adds a file to be parsed when the docs are generated
/// @param {string} filePath The file to add
function tome_add_file(_filePath){
	array_push(global.__tomeFileArray, _filePath);
}

/// @func tome_set_homepage_from_file(filePath)
/// @desc Sets the homepage to be the contents of a file (.txt, or .md)
/// @param {string} filePath The file to use as the homepage
function tome_set_homepage_from_file(_filePath){
	var _homePageParseStruct = __tome_parse_markdown(_filePath);
	global.__tomeHomepage = _homePageParseStruct.markdown;
}

/// @func tome_set_homepage_from_note(noteName)
/// @desc sets the homepage to be the contents of the note
/// @param {string} noteName The note to use as the homepage
function tome_set_homepage_from_note(_noteName){
	var _homePageParseStruct = __tome_parse_markdown(__tome_file_project_get_directory() + string("notes/{0}/{0}.txt", _noteName, _noteName));
	global.__tomeHomepage = _homePageParseStruct.markdown;
}

/// @func tome_add_to_sidebar(name, link, category)
/// @desc adds an item to the sidebar
/// @param {string} name The name of the item
/// @param {string} link The link to the item
/// @param {string} category The category of the item
function tome_add_to_sidebar(_name, _link, _category){
	var _sidebarItem = {
		title: _name,
		link: _link,
		category: _category
	}
	array_push(global.__tomeAdditionalSidebarItemsArray, _sidebarItem);
}

/// @func tome_set_site_name(name)
/// @desc sets the name of the site
/// @param {string} name The name of the site
function tome_set_site_name(_name){
	__tome_file_update_config("name", _name);
}

/// @func tome_set_site_description(desc)
/// @desc sets the description of the site
/// @param {string} desc The description of the site
function tome_set_site_description(_desc){
	__tome_file_update_config("description", _desc);
}

/// @func tome_set_site_theme_color(color)
/// @desc sets the theme color of the site
/// @param {string} color The theme color of the site
function tome_set_site_theme_color(_color){
	__tome_file_update_config("themeColor", _color);
}

/// @func tome_set_site_latest_version(versionName)
/// @desc sets the latest version of the docs
/// @param {string} versionName The latest version of the docs
function tome_set_site_latest_version(_versionName){
	global.__tomeLatestDocVersion = _versionName;
	__tome_file_update_config("latestVersion", _versionName);
}

/// @func tome_add_navbar_link(name, link)
/// @desc adds a link to the navbar
/// @param {string} name The name of the link
/// @param {string} link The link to the link
function tome_add_navbar_link(_name, _link){
	var _navbarItem = {
		name: _name,
		link: _link
	}
	array_push(global.__tomeNavbarItemsArray, _navbarItem);
}







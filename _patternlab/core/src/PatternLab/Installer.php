<?php

/*!
 * Installer Class
 *
 * Copyright (c) 2014 Dave Olsen, http://dmolsen.com
 * Licensed under the MIT license
 *
 * References the InstallerUtil class that is included in pattern-lab/core
 *
 */

namespace PatternLab;

use \Composer\Script\Event;
use \PatternLab\InstallerUtil;

class Installer {
	
	/**
	 * Run the PL tasks when a package is installed
	 * @param  {Object}     a script event object from composer
	 */
	public static function postPackageInstall(Event $event) {
		
		// make sure pattern lab has been loaded
		if (class_exists("\PatternLab\Config")) {
			
			InstallerUtil::postPackageInstall($event);
			
		}
		
	}
	
	/**
	 * Run the PL tasks when a package is updated
	 * @param  {Object}     a script event object from composer
	 */
	public static function postPackageUpdate(Event $event) {
		
		// make sure pattern lab has been loaded
		if (class_exists("\PatternLab\Config")) {
			
			InstallerUtil::postPackageUpdate($event);
			
		}
		
	}
	
	/**
	 * Make sure certain things are set-up before running composer's install
	 * @param  {Object}     a script event object from composer
	 */
	public static function preInstallCmd(Event $event) {
		
		// make sure pattern lab has been loaded
		if (class_exists("\PatternLab\Config")) {
			
			InstallerUtil::preInstallCmd($event);
			
		}
		
	}
	
	/**
	 * Run the PL tasks when a package is removed
	 * @param  {Object}     a script event object from composer
	 */
	public static function prePackageUninstall(Event $event) {
		
		// make sure pattern lab has been loaded
		if (class_exists("\PatternLab\Config")) {
			
			InstallerUtil::prePackageUninstallCmd($event);
			
		}
		
	}
	
}

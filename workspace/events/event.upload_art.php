<?php

	if(!defined('__IN_SYMPHONY__')) die('<h2>Error</h2><p>You cannot directly access this file</p>');



	Class eventupload_art extends Event{

		const ROOTELEMENT = 'upload-art';

		public $eParamFILTERS = array(
			'member-lock-role'
		);

		public static function about(){
			return array(
				'name' => 'Upload Art',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://wittgenstein.enguin.com/project/artists_registry',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2011-11-18T23:22:47+00:00',
				'trigger-condition' => 'action[upload-art]'
			);
		}

		public static function getSource(){
			return '8';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '<h1>Stuff</h1>';
		}

		public function load(){
			if(isset($_POST['action']['upload-art'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}

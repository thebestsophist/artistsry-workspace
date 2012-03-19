<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceregistry_current_artist_artwork_list extends Datasource{

		public $dsParamROOTELEMENT = 'registry-current-artist-artwork-list';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '12';
		public $dsParamSTARTPAGE = '{$url-page}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'upload-time';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'57' => 'yes',
				'91' => '{$ds-registry-current-artist}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'artwork',
				'external-media',
				'views: value only',
				'artist'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-registry-current-artist');
		}

		public function about(){
			return array(
				'name' => 'Registry Current Artist Artwork List',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://registry.homerart.org',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2012-01-31T08:42:23+00:00'
			);
		}

		public function getSource(){
			return '8';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceregistry_edit_current_artist extends Datasource{

		public $dsParamROOTELEMENT = 'registry-edit-current-artist';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$member-id}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'username',
				'email',
				'name',
				'biography: unformatted',
				'interests',
				'profile-image',
				'phone',
				'website',
				'etsy',
				'facebook',
				'twitter',
				'google-plus',
				'flickr',
				'youtube',
				'vimeo'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Registry Edit Current Artist',
				'author' => array(
					'name' => 'Homer Art',
					'website' => 'http://registry.homerart.org',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2012-02-02T07:07:15+00:00'
			);
		}

		public function getSource(){
			return '7';
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

<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceregistry_settings extends Datasource{

		public $dsParamROOTELEMENT = 'registry-settings';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		

		public $dsParamINCLUDEDELEMENTS = array(
				'open-registration',
				'media-queries',
				'counter',
				'registry-url'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Registry Settings',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://wittgenstein.enguin.com/project/artists_registry',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2011-11-15T22:46:27+00:00'
			);
		}

		public function getSource(){
			return '9';
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

			$doc = new SimpleXMLElement($result->generate());

			$param_pool['ds-registry-open-registration'] = array();
			    foreach($doc->xpath('//registry-settings/entry/open-registration') as $node){
			    $param_pool['ds-registry-open-registration'][] = (string)$node;
			}

			$param_pool['ds-registry-media-queries'] = array();
			    foreach($doc->xpath('//registry-settings/entry/media-queries') as $node){
			    $param_pool['ds-registry-media-queries'][] = (string)$node;
			}


			$param_pool['ds-registry-counter'] = array();
			    foreach($doc->xpath('//registry-settings/entry/counter') as $node){
			    $param_pool['ds-registry-counter'][] = (string)$node;
			}



			$param_pool['ds-registry-url'] = array();
			    foreach($doc->xpath('//registry-settings/entry/registry-url') as $node){
			    $param_pool['ds-registry-url'][] = (string)$node;
			}

			unset($doc);

			return $result;
		}

	}

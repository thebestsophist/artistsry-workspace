<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventcancel_upload extends Event{

		const ROOTELEMENT = 'cancel-upload';

		public $eParamFILTERS = array(
			'xss-fail',
				'member-lock-role'
		);

		public static function about(){
			return array(
				'name' => 'Cancel Upload',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://enguindesign.com',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2011-11-18T19:56:57+00:00',
				'trigger-condition' => 'action[cancel-upload]'
			);
		}

		public static function getSource(){
			return '8';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;cancel-upload result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/cancel-upload></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;cancel-upload result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/cancel-upload></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;cancel-upload result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/cancel-upload></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Title
    &lt;input name="fields[title]" type="text" />
  &lt;/label>
  &lt;label>Artwork
    &lt;input name="fields[artwork]" type="file" />
  &lt;/label>
  &lt;label>Upload Time
    &lt;input name="fields[upload-time]" type="text" />
  &lt;/label>
  &lt;label>Views
    &lt;input name="fields[views]" type="text" />
  &lt;/label>
  &lt;label>Description
    &lt;textarea name="fields[description]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>Artwork Tags
    &lt;input name="fields[artwork-tags]" type="text" />
  &lt;/label>
  &lt;label>Artist
    &lt;input name="fields[artist]" type="text" />
  &lt;/label>
  &lt;label>Publish
    &lt;input name="fields[publish]" type="checkbox" />
  &lt;/label>
  &lt;input name="action[cancel-upload]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://wittgenstein.enguin.com/project/artists_registry/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['cancel-upload'])) return $this->__trigger();
		}

		protected function __trigger(){ 
		    $entry_id = (int)$_POST['id'];  
		    require_once(TOOLKIT . '/class.entrymanager.php');
    		$entryManager = new EntryManager($this->_Parent);
    		$entryManager->delete($entry_id);
		}  

	}

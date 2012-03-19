<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventsend_feedback extends Event{

		const ROOTELEMENT = 'send-feedback';

		public $eParamFILTERS = array(
			'canofspam'
		);

		public static function about(){
			return array(
				'name' => 'Send Feedback',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://wittgenstein.enguin.com/project/artists_registry',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2012-01-27T23:00:48+00:00',
				'trigger-condition' => 'action[send-feedback]'
			);
		}

		public static function getSource(){
			return '14';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;send-feedback result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/send-feedback></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;send-feedback result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/send-feedback></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;send-feedback result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/send-feedback></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Title
    &lt;input name="fields[title]" type="text" />
  &lt;/label>
  &lt;label>Date Submitted
    &lt;input name="fields[date-submitted]" type="text" />
  &lt;/label>
  &lt;label>Comment
    &lt;textarea name="fields[comment]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>xml
    &lt;textarea name="fields[xml]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>URL
    &lt;input name="fields[url]" type="text" />
  &lt;/label>
  &lt;input name="fields[user]" type="hidden" value="..." />
  &lt;label>Browser
    &lt;textarea name="fields[browser]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;input name="action[send-feedback]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://wittgenstein.enguin.com/project/artists_registry/success/" /></code></pre>
        <h3>Can Of Spam Filter</h3>
        <p>
        To use the Can Of Spam filter, add the following field to your form:
      </p>
        <pre class="XML"><code>&lt;input name="canofspam" value="{$canofspam}" type="hidden" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['send-feedback'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}

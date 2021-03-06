<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventsend_message extends Event{

		const ROOTELEMENT = 'send-message';

		public $eParamFILTERS = array(
			'send-email',
				'canofspam'
		);

		public static function about(){
			return array(
				'name' => 'Send Message',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://wittgenstein.enguin.com/project/artists_registry',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2012-01-20T22:55:34+00:00',
				'trigger-condition' => 'action[send-message]'
			);
		}

		public static function getSource(){
			return '15';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;send-message result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/send-message></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;send-message result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/send-message></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;send-message result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/send-message></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Title
    &lt;input name="fields[title]" type="text" />
  &lt;/label>
  &lt;input name="fields[author]" type="hidden" value="..." />
  &lt;label>Message
    &lt;textarea name="fields[message]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>Published
    &lt;input name="fields[published]" type="text" />
  &lt;/label>
  &lt;input name="action[send-message]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://wittgenstein.enguin.com/project/artists_registry/success/" /></code></pre>
        <h3>Send Notification Email</h3>
        <p>Upon the event successfully saving the entry, this option takes input from the form and send an email to the desired recipient. <b>It currently does not work with "Allow Multiple".</b> The following are the recognised fields:</p>
        <pre class="XML"><code>send-email[sender-email] // Optional
send-email[sender-name] // Optional
send-email[reply-to-email] // Optional
send-email[reply-to-name] // Optional
send-email[subject]
send-email[body]
send-email[recipient] // list of comma-separated author usernames.</code></pre>
        <p>All of these fields can be set dynamically using the exact field name of another field in the form as shown below in the example form:</p>
        <pre class="XML"><code>&lt;form action="" method="post">
  &lt;fieldset>
    &lt;label>Name &lt;input type="text" name="fields[author]" value="" />&lt;/label>
    &lt;label>Email &lt;input type="text" name="fields[email]" value="" />&lt;/label>
    &lt;label>Message &lt;textarea name="fields[message]" rows="5" cols="21">&lt;/textarea>&lt;/label>
    &lt;input name="send-email[sender-email]" value="fields[email]" type="hidden" />
    &lt;input name="send-email[sender-name]" value="fields[author]" type="hidden" />
    &lt;input name="send-email[reply-to-email]" value="fields[email]" type="hidden" />
    &lt;input name="send-email[reply-to-name]" value="fields[author]" type="hidden" />
    &lt;input name="send-email[subject]" value="You are being contacted" type="hidden" />
    &lt;input name="send-email[body]" value="fields[message]" type="hidden" />
    &lt;input name="send-email[recipient]" value="fred" type="hidden" />
    &lt;input id="submit" type="submit" name="action[save-contact-form]" value="Send" />
  &lt;/fieldset>
&lt;/form></code></pre>
        <h3>Can Of Spam Filter</h3>
        <p>
        To use the Can Of Spam filter, add the following field to your form:
      </p>
        <pre class="XML"><code>&lt;input name="canofspam" value="{$canofspam}" type="hidden" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['send-message'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}

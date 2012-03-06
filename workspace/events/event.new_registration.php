<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventnew_registration extends Event{

		const ROOTELEMENT = 'new-registration';

		public $eParamFILTERS = array(
			'send-email',
				'xss-fail',
				'canofspam'
		);

		public static function about(){
			return array(
				'name' => 'New Registration',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://wittgenstein.enguin.com/project/artists_registry',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2011-11-14T22:34:09+00:00',
				'trigger-condition' => 'action[new-registration]'
			);
		}

		public static function getSource(){
			return '7';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;new-registration result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/new-registration></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;new-registration result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/new-registration></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;new-registration result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/new-registration></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Username
    &lt;input name="fields[username]" type="text" />
  &lt;/label>
  &lt;label>Email
    &lt;input name="fields[email]" type="text" />
  &lt;/label>
  &lt;fieldset>
    &lt;label>Password
      &lt;input name="fields[password][password]" type="password" />
    &lt;/label>
    &lt;label>Password Confirm
      &lt;input name="fields[password][confirm]" type="password" />
    &lt;/label>
  &lt;/fieldset>
  &lt;label>Role
    &lt;select name="fields[role]">
      &lt;option value="1">Public&lt;/option>
      &lt;option value="2">Artist&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Activation
    &lt;input name="fields[activation]" type="text" />
  &lt;/label>
  &lt;label>Name
    &lt;input name="fields[name]" type="text" />
  &lt;/label>
  &lt;label>Biography
    &lt;textarea name="fields[biography]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>Profile Image
    &lt;input name="fields[profile-image]" type="file" />
  &lt;/label>
  &lt;label>Phone
    &lt;input name="fields[phone]" type="text" />
  &lt;/label>
  &lt;label>Website
    &lt;input name="fields[website]" type="text" />
  &lt;/label>
  &lt;label>Facebook
    &lt;input name="fields[facebook]" type="text" />
  &lt;/label>
  &lt;label>Twitter
    &lt;input name="fields[twitter]" type="text" />
  &lt;/label>
  &lt;label>Google Plus
    &lt;input name="fields[google-plus]" type="text" />
  &lt;/label>
  &lt;label>Flickr
    &lt;input name="fields[flickr]" type="text" />
  &lt;/label>
  &lt;label>Youtube
    &lt;input name="fields[youtube]" type="text" />
  &lt;/label>
  &lt;label>Vimeo
    &lt;input name="fields[vimeo]" type="text" />
  &lt;/label>
  &lt;label>Artwork
    &lt;input name="fields[artwork]" type="text" />
  &lt;/label>
  &lt;input name="fields[interests]" type="hidden" value="..." />
  &lt;input name="action[new-registration]" type="submit" value="Submit" />
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
			if(isset($_POST['action']['new-registration'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}

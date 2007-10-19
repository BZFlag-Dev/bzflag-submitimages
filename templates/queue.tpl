{foreach from=$data.queue item=item name=queue}
{if $smarty.foreach.queue.first}<div>The following items are pending approval. Please keep in mind the <a href="{$config.paths.baseURL}tos.php">Terms Of Service</a> when approving images.</div>
<table border="1">
  <tr><th>Thumbnail</th><th>Author Information</th><th>Uploader Information</th><th>Approve/Reject</th></tr>
{/if}

  <tr>
    <td><a href="{$config.paths.baseURL}getimage.php?filename={$item.bzid}_{$item.filename}"><img src="{$config.paths.baseURL}getthumb.php?filename={$item.bzid}_{$item.filename}" alt="{$item.filename} by {$item.authorname}"></a></td>
    <td>
      <strong>Author Name:</strong> {$item.authorname}<br>
{if $item.licenseid != 255}
      <strong>License:</strong> {$config.licenses[$item.licenseid].name}<br>
{else}
      <strong><i>Custom License:</i></strong> {$item.licensename}<br>
      <strong><i>License URL:</i></strong> {if $item.licenseurl}<a href="{$item.licenseurl}">View</a>{else}Not specified{/if}<br>
      <strong><i>License Text:</i></strong> {if $item.licensebody}{$item.licensebody|nl2br}{else}Not specified{/if}
{/if}
    </td>
    <td>
      <strong>Uploader Real Name:</strong> {$item.uploaderfirstname} {$item.uploaderlastname}<br>
      <strong>Uploader Username:</strong> {$item.username}
    </td>
    <td>
      <form action="{$config.paths.baseURL}queue.php" method="POST"><div>
      <input type="hidden" name="queueid" value="{$item.queueid}">
      <strong>Message to user:</strong><br>
      <textarea name="message" cols="20" rows="4"></textarea><br>
      <input type="submit" style="background-color: green;" name="action" value="Accept">
      <input type="submit" style="background-color: red;" name="action" value="Reject">
      </div></form>
    </td>
  </tr>

{if $smarty.foreach.queue.last}</table>{/if}

{foreachelse}
  <div>There are currently no images pending approval.</div>
{/foreach}

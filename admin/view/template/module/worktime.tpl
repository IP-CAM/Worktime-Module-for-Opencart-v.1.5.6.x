<?php echo $header; ?>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
            <thead>
                <tr>
                    <td class="left"><span class="required">*</span><?php echo $text_mon; ?></td>
                    <td class="left"><span class="required">*</span><?php echo $text_tue; ?></td>
                    <td class="left"><span class="required">*</span><?php echo $text_wed; ?></td>
                    <td class="left"><span class="required">*</span><?php echo $text_thu; ?></td>
                    <td class="left"><span class="required">*</span><?php echo $text_fri; ?></td>
                    <td class="left"><span class="required">*</span><?php echo $text_sat; ?></td>
                    <td class="left"><span class="required">*</span><?php echo $text_sun; ?></td>
                </tr>
            </thead>
            <tbody>
                <tr id="days">
                    <td class="left">
                        <input type="text" name="worktime[mon][of]" size="5" value="<?php echo (isset($worktime['mon']) ? $worktime['mon']['of'] : ''); ?>" /> -
                        <input type="text" name="worktime[mon][to]" size="5" value="<?php echo (isset($worktime['mon']) ? $worktime['mon']['to'] : ''); ?>" />
                        <span class="error"><?php echo $error_time_mon; ?></span>
                    </td>
                    <td class="left">
                        <input type="text" name="worktime[tue][of]" size="5" value="<?php echo (isset($worktime['tue']) ? $worktime['tue']['of'] : ''); ?>" /> -
                        <input type="text" name="worktime[tue][to]" size="5" value="<?php echo (isset($worktime['tue']) ? $worktime['tue']['to'] : ''); ?>" />
                        <span class="error"><?php echo $error_time_tue; ?></span>
                    </td>
                    <td class="left">
                        <input type="text" name="worktime[wed][of]" size="5" value="<?php echo (isset($worktime['wed']) ? $worktime['wed']['of'] : ''); ?>" /> -
                        <input type="text" name="worktime[wed][to]" size="5" value="<?php echo (isset($worktime['wed']) ? $worktime['wed']['to'] : ''); ?>" />
                        <span class="error"><?php echo $error_time_wed;?></span>
                    </td>
                    <td class="left">
                        <input type="text" name="worktime[thu][of]" size="5" value="<?php echo (isset($worktime['thu']) ? $worktime['thu']['of'] : ''); ?>" /> -
                        <input type="text" name="worktime[thu][to]" size="5" value="<?php echo (isset($worktime['thu']) ? $worktime['thu']['to'] : ''); ?>" />
                        <span class="error"><?php echo $error_time_thu;?></span>
                    </td>
                    <td class="left">
                        <input type="text" name="worktime[fri][of]" size="5" value="<?php echo (isset($worktime['fri']) ? $worktime['fri']['of'] : ''); ?>" /> -
                        <input type="text" name="worktime[fri][to]" size="5" value="<?php echo (isset($worktime['fri']) ? $worktime['fri']['to'] : ''); ?>" />
                        <span class="error"><?php echo $error_time_fri;?></span>
                    </td>
                    <td class="left">
                        <input type="text" name="worktime[sat][of]" size="5" value="<?php echo (isset($worktime['sat']) ? $worktime['sat']['of'] : ''); ?>" /> -
                        <input type="text" name="worktime[sat][to]" size="5" value="<?php echo (isset($worktime['sat']) ? $worktime['sat']['to'] : ''); ?>" />
                        <span class="error"><?php echo $error_time_sat;?></span>
                    </td>
                    <td class="left">
                        <input type="text" name="worktime[sun][of]" size="5" value="<?php echo (isset($worktime['sun']) ? $worktime['sun']['of'] : ''); ?>" /> -
                        <input type="text" name="worktime[sun][to]" size="5" value="<?php echo (isset($worktime['sun']) ? $worktime['sun']['to'] : ''); ?>" />
                        <span class="error"><?php echo $error_time_sun;?></span>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $text_description_top; ?></b></td>
                    <td colspan="2">
                        <textarea rows="6" cols="50" name="worktime[description_top]"><?php echo (isset($worktime['description_top']) ? $worktime['description_top'] : ''); ?></textarea>
                    </td>
                    <td><b><?php echo $text_description_bot; ?></b></td>
                    <td colspan="2">
                        <textarea rows="6" cols="50" name="worktime[description_bot]"><?php echo (isset($worktime['description_bot']) ? $worktime['description_bot'] : ''); ?></textarea>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="worktime_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="worktime_module[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="worktime_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="worktime_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#days input').timepicker({
    altFieldTimeOnly:false
});
//--></script>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="worktime_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="worktime_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="worktime_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="worktime_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script> 
<?php echo $footer; ?>
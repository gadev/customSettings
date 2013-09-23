/**
 * customSettings
 * Plugin to add your system settings
 * 
 * @category    plugin
 * @version     1.0
 * @author      Modx.im
 * @internal    @properties &settings=Settings;textarea;Параметр~setting_name
 * @internal    @events OnSiteSettingsRender
 * @internal    @modx_category Manager and Admin
 * 
 * Exemple config: &hideFields=Скрываем;text;phone,mobilephone,zip,country,dob,gender &renameFields=Переименовываем;textarea;state||Регион:,comment||Контакты:
 *
 */

$e = &$modx->Event;
$output = "";

if ($e->name == 'OnSiteSettingsRender'){

$settingsArr = !empty($settings) ? explode('||',$settings) : array('Example custom setting~custom_st_example');

$output .= '<table>';

foreach($settingsArr as $key => $st_row){
    $st_label_arr = explode('~',$st_row);
    $custom_st_label = trim($st_label_arr[0]);
    $custom_st_name = isset($st_label_arr[1]) ? $st_label_arr[1] : 'custom_st';
    $custom_st_value = isset($st_label_arr[1]) && isset($modx->config[$st_label_arr[1]]) ? trim($modx->config[$st_label_arr[1]]) : '';
    $output .= '
      <tr>
        <td nowrap="nowrap" class="warning" width="200">'.$custom_st_label.'</td>
        <td><input type="text" value="'.$custom_st_value.'" name="'.$custom_st_name.'" style="width: 350px;" onchange="documentDirty=true;" /></td>
      </tr>
    ';
}

$output .= '</table>';

}

$e->output($output);
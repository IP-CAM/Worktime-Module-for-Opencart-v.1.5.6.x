<?php  
class ControllerModuleWorktime extends Controller {
	protected function index($setting) {
	   $this->load->language('module/worktime');
       $day_name = array($this->language->get('text_mon'),$this->language->get('text_tue'),$this->language->get('text_wed'),$this->language->get('text_thu'),$this->language->get('text_fri'),$this->language->get('text_sat'),$this->language->get('text_sun'));
       $worktime = $this->config->get('worktime');
       $day_time = array($worktime['mon']['of'].'-'.$worktime['mon']['to'],$worktime['tue']['of'].'-'.$worktime['tue']['to'],$worktime['wed']['of'].'-'.$worktime['wed']['to'],$worktime['thu']['of'].'-'.$worktime['thu']['to'],$worktime['fri']['of'].'-'.$worktime['fri']['to'],$worktime['sat']['of'].'-'.$worktime['sat']['to'],$worktime['sun']['of'].'-'.$worktime['sun']['to']);
       
       $this->data['heading_title'] = $this->language->get('heading_title');
       $this->data['description_top'] = $worktime['description_top'];
       $this->data['description_bot'] = $worktime['description_bot'];
       $this->data['worktime'] = $this->str_day(0,$day_time,$day_name);
       
       		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/worktime.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/worktime.tpl';
		} else {
			$this->template = 'default/template/module/worktime.tpl';
		}
		
		$this->render();
	}
    
    private function count_day($dey_time,$day) {
        $n = $day;
        for($i=$day;$i<6;$i++){
    
            if($dey_time[$i] == $dey_time[$i+1]){
                $n++;
            } else {
                break;
            }
    
        }
        return $n; 
    }
    
    private function str_day($day,$dey_time,$day_name,$str='') {
        $n = $this->count_day($dey_time,$day);
        if($n == $day) {
            if($dey_time[$day] != '00:00-00:00') {
                $time = $dey_time[$day];
            } else {
                $time = $this->language->get('text_dayoff');
            }
        
        $str .= $day_name[$day].': '.$time.'<br />';
        } else {
        if($dey_time[$day] != '00:00-00:00') {
            $time = $dey_time[$day];
        } else {
            $time = $this->language->get('text_dayoff');
        }
        $str .= $day_name[$day].' - '.$day_name[$n].': '.$time.'<br />';
        }
        if($n != 6) {
           $str .= $this->str_day($n+1,$dey_time,$day_name);
        } 
        
        return $str;
        }
    
}
?>
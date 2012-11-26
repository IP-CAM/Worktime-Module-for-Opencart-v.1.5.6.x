<?php
class ControllerModuleWorktime extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/worktime');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('worktime', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
        $this->data['text_mon'] = $this->language->get('text_mon');
        $this->data['text_tue'] = $this->language->get('text_tue');
        $this->data['text_wed'] = $this->language->get('text_wed');
        $this->data['text_thu'] = $this->language->get('text_thu');
        $this->data['text_fri'] = $this->language->get('text_fri');
        $this->data['text_sat'] = $this->language->get('text_sat');
        $this->data['text_sun'] = $this->language->get('text_sun');
        $this->data['text_description_top'] = $this->language->get('text_description_top');
        $this->data['text_description_bot'] = $this->language->get('text_description_bot');
		
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
        
        if (isset($this->error['time_mon'])) {
			$this->data['error_time_mon'] = $this->error['time_mon'];
		} else {
			$this->data['error_time_mon'] = '';
		}
        if (isset($this->error['time_tue'])) {
			$this->data['error_time_tue'] = $this->error['time_tue'];
		} else {
			$this->data['error_time_tue'] = '';
		}
        if (isset($this->error['time_wed'])) {
			$this->data['error_time_wed'] = $this->error['time_wed'];
		} else {
			$this->data['error_time_wed'] = '';
		}
        if (isset($this->error['time_thu'])) {
			$this->data['error_time_thu'] = $this->error['time_thu'];
		} else {
			$this->data['error_time_thu'] = '';
		}
        if (isset($this->error['time_fri'])) {
			$this->data['error_time_fri'] = $this->error['time_fri'];
		} else {
			$this->data['error_time_fri'] = '';
		}
        if (isset($this->error['time_sat'])) {
			$this->data['error_time_sat'] = $this->error['time_sat'];
		} else {
			$this->data['error_time_sat'] = '';
		}
        if (isset($this->error['time_sun'])) {
			$this->data['error_time_sun'] = $this->error['time_sun'];
		} else {
			$this->data['error_time_sun'] = '';
		}
				
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/worktime', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/worktime', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['worktime_module'])) {
			$this->data['modules'] = $this->request->post['worktime_module'];
		} elseif ($this->config->get('worktime_module')) { 
			$this->data['modules'] = $this->config->get('worktime_module');
		}
        $this->data['worktime'] = array();
        if (isset($this->request->post['worktime'])) {
			$this->data['worktime'] = $this->request->post['worktime'];
		} elseif ($this->config->get('worktime')) { 
			$this->data['worktime'] = $this->config->get('worktime');
		} 
        	
        $this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/worktime.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
    private function validate() {
		if (!$this->user->hasPermission('modify', 'module/worktime')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
        
        if (strlen($this->request->post['worktime']['mon']['of']) < 5 or strlen($this->request->post['worktime']['mon']['to']) < 5) {
				$this->error['time_mon'] = $this->language->get('error_time');
			}
        if (strlen($this->request->post['worktime']['tue']['of']) < 5 or strlen($this->request->post['worktime']['tue']['to']) < 5) {
				$this->error['time_tue'] = $this->language->get('error_time');
			}
        if (strlen($this->request->post['worktime']['wed']['of']) < 5 or strlen($this->request->post['worktime']['wed']['to']) < 5) {
				$this->error['time_wed'] = $this->language->get('error_time');
			}
        if (strlen($this->request->post['worktime']['thu']['of']) < 5 or strlen($this->request->post['worktime']['thu']['to']) < 5) {
				$this->error['time_thu'] = $this->language->get('error_time');
			}
        if (strlen($this->request->post['worktime']['fri']['of']) < 5 or strlen($this->request->post['worktime']['fri']['to']) < 5) {
				$this->error['time_fri'] = $this->language->get('error_time');
			}
        if (strlen($this->request->post['worktime']['sat']['of']) < 5 or strlen($this->request->post['worktime']['sat']['to']) < 5) {
				$this->error['time_sat'] = $this->language->get('error_time');
			}
        if (strlen($this->request->post['worktime']['sun']['of']) < 5 or strlen($this->request->post['worktime']['sun']['to']) < 5) {
				$this->error['time_sun'] = $this->language->get('error_time');
			}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>
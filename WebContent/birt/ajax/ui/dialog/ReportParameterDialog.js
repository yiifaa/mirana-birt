/**
 * 
 */

function ReportParameterDialog(id) {
	this.view = jQuery(document.getElementById(id))
	this.view.modal({
			backdrop : 'static',
			keyboard : false,
			show : false	// 默认是否显示
	});	
}

jQuery.extend(ReportParameterDialog.prototype, {
	
	
	__cb_bind () {
		this.__l_show();
	},
	
	__l_show () {
		this.view.modal('show');
	},
	
	__l_hide () {
		this.view.modal('hide');
	},
	
	__is_parameter_allowblank : function(dataType) {
		if(!dataType)
			return false;
		
		if(dataType == Constants.TYPE_ANY)
			return true;
		
		if(dataType == Constants.TYPE_STRING)
			return true;

		return false;		
	},
	
	__is_parameter_required (oInputs) {
		if(!oInputs || oInputs.length <= 0)
			return false;
		
		var flag = false;		
		for(var i = 0; i< oInputs.length; i++)
		{
			// if find defined input control
			if(oInputs[i].id == 'isRequired' && oInputs[i].value == 'true')
			{
				flag = true;
				break;		
			}
		}
		
		return flag;
	},
	
	collect_parameter () {
		this.__parameter = new Array();		
		
		var k = 0;
		//oTRC[i] is <tr></tr> section
		var oTRC = document.getElementById("parameter_table").getElementsByTagName("TR");
		for(var i = 0; i < oTRC.length; i++)
		{
			if(!this.__parameter[k])
			{
				this.__parameter[k] = { };
			}
			
			//input element collection
			var oIEC = oTRC[i].getElementsByTagName("input");
			//select element collection
			var oSEC = oTRC[i].getElementsByTagName("select");
			//avoid group parameter
			var oTable = oTRC[i].getElementsByTagName("table");
			if(oTable.length > 0 || (oSEC.length == 0 && oIEC.length == 0) || (oIEC.length == 1 && oIEC[0].type == 'submit'))
			{
				continue;
			}
			
			// control type
			var oType = oIEC[0].value;

			// deal with "hidden" parameter
			if(oType == 'hidden')
			{
				var temp = oIEC[1];
				this.__parameter[k].name = temp.name;
				this.__parameter[k].value = temp.value;
				k++;
				
				// set display text
				if(!this.__parameter[k])
				{
					this.__parameter[k] = { };
				}
				this.__parameter[k].name = this.__isdisplay + this.__parameter[k-1].name;
				this.__parameter[k].value = oIEC[2].value;
				k++;		
				
				continue;
			}
			
			// deal with "checkbox" parameter
			if(oType == 'checkbox')
			{
				var temp = oIEC[2];
				this.__parameter[k].name = temp.value;
				temp.checked?this.__parameter[k].value = 'true':this.__parameter[k].value = 'false';  
				k++;
				continue;
			}
						
			// deal with "text" parameter
			if(oType == 'text')
			{
				// data type of current parameter
				var dataType = oIEC[1].value;
				
				// allow null
				if(oIEC[2] && oIEC[2].type == 'radio')
				{
					if(oIEC[2].checked)
					{
						var paramName = oIEC[3].name;
						var paramValue = oIEC[4].value;
						var displayText = oIEC[5].value;

						if(displayText != oIEC[3].value)
						{
							// change the text field value,regard as a locale string
							paramValue = oIEC[3].value;
							
							// set isLocale flag							
							this.__parameter[k].name = this.__islocale;
							this.__parameter[k].value = paramName;
							k++;	
						}
																		
						// check if required
						if(this.__is_parameter_required(oIEC) 
							&& birtUtility.trim(paramValue) == '' && this.visible)
						{
							oIEC[3].focus();
							alert(birtUtility.formatMessage(Constants.error.parameterRequired, paramName));
							return false;
						}
						
						// check if allow blank
						if(!this.__is_parameter_allowblank(dataType)
							&& birtUtility.trim(paramValue) == '' && this.visible)
						{
							oIEC[3].focus();
							alert(birtUtility.formatMessage(Constants.error.parameterNotAllowBlank, paramName));
							return false;							
						}	
													
						// set parameter value
						if(!this.__parameter[k])
						{
							this.__parameter[k] = { };
						}
						this.__parameter[k].name = paramName;
						this.__parameter[k].value = paramValue;
						k++;
						
						// set display text
						if(!this.__parameter[k])
						{
							this.__parameter[k] = { };
						}
						this.__parameter[k].name = this.__isdisplay + this.__parameter[k-1].name;
						this.__parameter[k].value = oIEC[3].value;
						k++;						
					}
					else
					{
						// select null value
						this.__parameter[k].name = this.__isnull;
						this.__parameter[k].value = oIEC[2].value;
						k++;
					}										
				}
				// not allow null
				else
				{
					var paramName = oIEC[2].name;
					var fieldValue = oIEC[2].value;
					var paramValue = oIEC[3].value;
					var displayText = oIEC[4].value;

					// convert spaces to non-breakable spaces if data type is a number					
					if (this.__is_parameter_number(dataType))
					{
						fieldValue = this.__convert_spaces_to_nbsp(fieldValue);
					}
					
					if(displayText != fieldValue)
					{
						// change the text field value,regard as a locale string
						paramValue = fieldValue;
						
						// set isLocale flag							
						this.__parameter[k].name = this.__islocale;
						this.__parameter[k].value = paramName;
						k++;	
					}
															
					// check if required
					if(this.__is_parameter_required(oIEC) 
						&& birtUtility.trim(paramValue) == '' && this.visible)
					{
						oIEC[2].focus();
						alert(birtUtility.formatMessage(Constants.error.parameterRequired, paramName));
						return false;
					}

					// check if allow blank
					if(!this.__is_parameter_allowblank(dataType)
						&& birtUtility.trim(paramValue) == '' && this.visible)
					{
						oIEC[2].focus();
						alert(birtUtility.formatMessage(Constants.error.parameterNotAllowBlank, paramName));
						return false;							
					}	
												
					// set parameter value
					if(!this.__parameter[k])
					{
						this.__parameter[k] = { };
					}
					this.__parameter[k].name = paramName;
					this.__parameter[k].value = paramValue;
					k++;
						
					// set display text
					if(!this.__parameter[k])
					{
						this.__parameter[k] = { };
					}
					this.__parameter[k].name = this.__isdisplay + this.__parameter[k-1].name;
					this.__parameter[k].value = fieldValue;
					k++;					
				}
				
				continue;
			}
			
			// deal with "radio" parameter
			if(oType == 'radio')
			{
				var dataType = oIEC[1].value;
				
				if(oIEC.length > 2)
				{
					for(var j = 2; j < oIEC.length; j++)
					{
						// deal with radio
						if(oIEC[j].type == 'radio' && oIEC[j].checked)
						{
							// null value
							if(oIEC[j].id == oIEC[j].name + "_null")
							{
								this.__parameter[k].name = this.__isnull;
								this.__parameter[k].value = oIEC[j].name;
								k++;
							}
							else
							{
								// check if allow blank
								if(!this.__is_parameter_allowblank(dataType)
									&& birtUtility.trim(oIEC[j].value) == '' && this.visible)
								{
									oIEC[j].focus();
									alert(birtUtility.formatMessage(Constants.error.parameterNotAllowBlank, oIEC[j].name));
									return false;							
								}	
							
								// common radio value
								this.__parameter[k].name = oIEC[j].name;
								this.__parameter[k].value = oIEC[j].value;	
								k++;
								
								// set display text for the "radio" parameter
								var displayLabel = document.getElementById(oIEC[j].id + "_label");
								if(displayLabel)
								{							
									if(!this.__parameter[k])
									{
										this.__parameter[k] = { };
									}
									this.__parameter[k].name = this.__isdisplay + this.__parameter[k-1].name;
									this.__parameter[k].value = displayLabel.title;
									k++;			
								}
							}	
							
							break;								
						}	
					}
				}
								
				continue;		
			}
			
			// deal with "select" parameter
			if(oType == 'select' && oSEC.length == 1)
			{
				var dataType = oIEC[1].value;
				var paramName = oIEC[2].name;
				
				var flag = true;
				if(oIEC[3] && oIEC[3].type == 'radio' && !oIEC[3].checked)
				{
					flag = false;
				}
				
				// need check selection
				if(flag)
				{
					if (this.__is_parameter_required(oIEC) && oSEC[0].selectedIndex < 0 && this.visible)
					{
						oSEC[0].focus();
						alert(birtUtility.formatMessage(Constants.error.parameterNotSelected, paramName));
						return false;
					}
																									
					if(oSEC[0].multiple)
					{
						var options = oSEC[0].options;
						for(var l = 0; l < options.length; l++)
						{
							if(!options[l].selected)
								continue;
							
							var tempText = options[l].text;
							var tempValue = options[l].value;
															
							// check if isRequired
							if(this.__is_parameter_required(oIEC) 
								&& birtUtility.trim(tempValue) == '' && this.visible)
							{
								oSEC[0].focus();
								alert(birtUtility.formatMessage(Constants.error.parameterRequired, paramName));
								return false;									
							}
							
							if(tempValue == Constants.nullValue)
								continue;
								
							// check if allow blank
							if(!this.__is_parameter_allowblank(dataType)
								&& birtUtility.trim(tempValue) == '' && this.visible)
							{
								oSEC[0].focus();
								alert(birtUtility.formatMessage(Constants.error.parameterNotAllowBlank, paramName));
								return false;							
							}									
						}
					}
					else
					{
						var tempText = oSEC[0].options[oSEC[0].selectedIndex].text;
						var tempValue = oSEC[0].options[oSEC[0].selectedIndex].value;
											
						// check if isRequired
						if (this.__is_parameter_required(oIEC)
							 && birtUtility.trim(tempValue) == '' && this.visible)
						{
							oSEC[0].focus();
							alert(birtUtility.formatMessage(Constants.error.parameterRequired, paramName));
							return false;
						}

						// Check if select 'Null Value' option for single parameter
						if(tempValue == Constants.nullValue)
						{
							this.__parameter[k].name = this.__isnull;
							this.__parameter[k].value = paramName;
							k++;	
							continue;
						}
							
						// check if allow blank
						if(!this.__is_parameter_allowblank(dataType)
							&& birtUtility.trim(tempValue) == '' && this.visible)
						{
							oSEC[0].focus();
							alert(birtUtility.formatMessage(Constants.error.parameterNotAllowBlank, paramName));
							return false;							
						}							
					}					
				}
				
				// allow new value
				if(oIEC[3] && oIEC[3].type == 'radio')
				{					
					if(oIEC[3].checked)
					{
						// select value
						var tempText = oSEC[0].options[oSEC[0].selectedIndex].text;
						var tempValue = oSEC[0].options[oSEC[0].selectedIndex].value;
											
						// set value
						this.__parameter[k].name = paramName;
						this.__parameter[k].value = tempValue;
						k++;
						
						// set display text
						if(!this.__parameter[k])
						{
							this.__parameter[k] = { };
						}
						this.__parameter[k].name = this.__isdisplay + this.__parameter[k-1].name;
						this.__parameter[k].value = tempText;
						k++;						
					}
					else
					{
						var inputValue = oIEC[5].value;
						var paramValue = oIEC[2].value;
						var displayText = oIEC[6].value;
						
						// if change the text field value or input text field isn't focus default,regard as a locale string 
						if(displayText != inputValue || oIEC[5].name.length <= 0)
						{							
							paramValue = inputValue;
							
							// set isLocale flag							
							this.__parameter[k].name = this.__islocale;
							this.__parameter[k].value = paramName;
							k++;	
						}
						
						// check if isRequired
						if (this.__is_parameter_required(oIEC) 
							 && birtUtility.trim(paramValue) == '' && this.visible)
						{
							oIEC[5].focus();
							alert(birtUtility.formatMessage(Constants.error.parameterRequired, paramName));
							return false;
						}						

						// check if allow blank
						if(!this.__is_parameter_allowblank(dataType)
							&& birtUtility.trim(paramValue) == '' && this.visible)
						{
							oIEC[5].focus();
							alert(birtUtility.formatMessage(Constants.error.parameterNotAllowBlank, paramName));
							return false;							
						}	
						
						// set value
						if(!this.__parameter[k])
						{
							this.__parameter[k] = { };
						}
						this.__parameter[k].name = paramName;
						this.__parameter[k].value = paramValue;
						k++;
											
						// set display text
						if(!this.__parameter[k])
						{
							this.__parameter[k] = { };
						}
						this.__parameter[k].name = this.__isdisplay + this.__parameter[k-1].name;
						this.__parameter[k].value = inputValue;
						k++;						
					}
				}
				else
				{
					// don't allow new value
					
					// multi-value case
					if(oSEC[0].multiple)
					{
						// allow multi value
						var options = oSEC[0].options;
						// record the old length
						var ck = k;
						
						for(var l = 0; l < options.length; l++)
						{
							if(!options[l].selected)
								continue;
							
							var tempText = options[l].text;
							var tempValue = options[l].value;
							
							// Check if select 'Null Value' option
							if(tempValue == Constants.nullValue)
							{
								if(!this.__parameter[k])
								{
									this.__parameter[k] = { };
								}
							
								this.__parameter[k].name = this.__isnull;
								this.__parameter[k].value = paramName;
								k++;	
								continue;
							}		

							// set value
							if(!this.__parameter[k])
							{
								this.__parameter[k] = { };
							}
							this.__parameter[k].name = paramName;
							this.__parameter[k].value = tempValue;
							k++;
						
							// set display text
							if(!this.__parameter[k])
							{
								this.__parameter[k] = { };
							}
							this.__parameter[k].name = this.__isdisplay + this.__parameter[k-1].name;
							this.__parameter[k].value = tempText;
							k++;
						}
						
						// compare the length, if no any selection processed, should be an empty list.
						if (ck == k)
						{
							if(!this.__parameter[k])
							{
								this.__parameter[k] = { };
							}
						
							this.__parameter[k].name = this.__isnulllist;
							this.__parameter[k].value = paramName;
							k++;	
						}
					}
					else
					{
						// allow single value
						var tempText = oSEC[0].options[oSEC[0].selectedIndex].text;
						var tempValue = oSEC[0].options[oSEC[0].selectedIndex].value;
													
						// set value
						this.__parameter[k].name = paramName;
						this.__parameter[k].value = tempValue;
						k++;
						
						// set display text
						if(!this.__parameter[k])
						{
							this.__parameter[k] = { };
						}
						this.__parameter[k].name = this.__isdisplay + this.__parameter[k-1].name;
						this.__parameter[k].value = tempText;
						k++;
					}					
				}
				
				continue;
			}			
		}		
		return true;
	}
	
})


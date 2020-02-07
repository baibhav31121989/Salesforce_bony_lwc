/**
 * @File Name          : selector.js
 * @Description        : 
 * @Author             : Baibhav Kumar
 * @Group              : 
 * @Last Modified By   : Baibhav Kumar
 * @Last Modified On   : 12/6/2019, 3:07:42 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    12/6/2019   Baibhav Kumar     Initial Version
**/
import { LightningElement, track, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';
const fields = [NAME_FIELD];

export default class Selector extends LightningElement {
    @track selectedProductId;
    handleProductSelected(evt) {
        this.selectedProductId = evt.detail;
    }
    userId = Id;
    @wire(getRecord, { recordId: '$userId', fields })
    user;
    get name() {
        return getFieldValue(this.user.data, NAME_FIELD);
    }
}
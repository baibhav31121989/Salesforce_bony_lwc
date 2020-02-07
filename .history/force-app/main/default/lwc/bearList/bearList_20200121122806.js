/**
 * @File Name          : bearList.js
 * @Description        : 
 * @Author             : Baibhav Kumar
 * @Group              : 
 * @Last Modified By   : Baibhav Kumar
 * @Last Modified On   : 1/21/2020, 12:28:06 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    1/21/2020   Baibhav Kumar     Initial Version
**/
import { LightningElement, track } from 'lwc';
import ursusResources from '@salesforce/resourceUrl/ursus_park';
/** BearController.getAllBears() Apex method */
import getAllBears from '@salesforce/apex/BearController.getAllBears';
export default class BearList extends LightningElement {
	@track bears;
	@track error;
	appResources = {
		bearSilhouette: ursusResources +'/img/standing-bear-silhouette.png',
	};
	connectedCallback() {
		this.loadBears();
	}
	loadBears() {
		getAllBears()
			.then(result => {
				this.bears = result;
			})
			.catch(error => {
				this.error = error;
			});
	}
}
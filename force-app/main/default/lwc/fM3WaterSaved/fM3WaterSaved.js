import { LightningElement, wire } from 'lwc';
import fetchSaved from '@salesforce/apex/fetchWaterSaved.fetchWaterSaved';
import fetchSavedLM from '@salesforce/apex/fetchWaterSaved.fetchWaterSavedLm';



export default class FM3DeviceCount extends LightningElement {

    @wire(fetchSaved) Saved;
    @wire(fetchSavedLM) SavedLM;

}
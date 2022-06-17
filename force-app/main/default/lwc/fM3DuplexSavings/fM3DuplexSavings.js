import { LightningElement, wire } from 'lwc';
import fetchSaved from '@salesforce/apex/fetchDuplexSavings.fetchDuplexSaved';
import fetchSavedLM from '@salesforce/apex/fetchDuplexSavings.fetchDuplexSavedLm';



export default class FM3DeviceCount extends LightningElement {

    @wire(fetchSaved) Saved;
    @wire(fetchSavedLM) SavedLM;

}
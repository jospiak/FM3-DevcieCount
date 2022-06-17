import { LightningElement, wire } from 'lwc';
import fetchSaved from '@salesforce/apex/fetchTreesSaved.fetchTreesSaved';
import fetchSavedLM from '@salesforce/apex/fetchTreesSaved.fetchTreesSavedLm';



export default class FM3DeviceCount extends LightningElement {

    @wire(fetchSaved) Saved;
    @wire(fetchSavedLM) SavedLM;

}
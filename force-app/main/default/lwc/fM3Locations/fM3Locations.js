import { LightningElement, wire } from 'lwc';
import fetchAmer from '@salesforce/apex/fetchLocations.fetchAmer';
import fetchEmea from '@salesforce/apex/fetchLocations.fetchEmea';
import fetchApac from '@salesforce/apex/fetchLocations.fetchApac';
import fetchAll from '@salesforce/apex/fetchLocations.fetchAll';
import FontAwesome from '@salesforce/resourceUrl/FontAwesome';

export default class FM3Locations extends LightningElement {

    @wire(fetchAmer) Amer;
    @wire(fetchEmea) Emea;
    @wire(fetchApac) Apac;
    @wire(fetchAll) All;
}
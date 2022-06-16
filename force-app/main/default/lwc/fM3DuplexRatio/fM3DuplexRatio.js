import { LightningElement, wire } from 'lwc';
import fetchDuplex from '@salesforce/apex/fetchDuplexRatio.fetchDuplex';
import fetchDuplexDetails from '@salesforce/apex/fetchDuplexRatio.fetchDuplexDetails';


export default class FM3DeviceCount extends LightningElement {

    @wire(fetchDuplex) Duplex;
    @wire(fetchDuplexDetails) Details;
}
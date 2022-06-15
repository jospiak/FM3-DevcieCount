import { LightningElement, wire } from 'lwc';
import fetch from '@salesforce/apex/fetchOnlineDevices.fetchDevices';

export default class FM3DeviceCount extends LightningElement {
    @wire(fetch) online;
}
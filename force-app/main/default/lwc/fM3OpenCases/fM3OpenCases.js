import { LightningElement, wire } from 'lwc';
import fetchuniFLOW from '@salesforce/apex/fetchOpenServiceRequests.fetchOpenUniFLOW';
import fetchDeviceSupport from '@salesforce/apex/fetchOpenServiceRequests.fetchOpenDeviceSuppot';
import fetchAll from '@salesforce/apex/fetchOpenServiceRequests.fetchOpenAll';

export default class FM3DeviceCount extends LightningElement {
    @wire(fetchuniFLOW) uniFLOW;
    @wire(fetchDeviceSupport) DeviceSupport;
    @wire(fetchAll) All;
}
import { LightningElement, wire } from 'lwc';
import fetchOnline from '@salesforce/apex/fetchOnlineDevices.fetchOnline';
import fetchOffline from '@salesforce/apex/fetchOnlineDevices.fetchOffline';
import fetchRetired from '@salesforce/apex/fetchOnlineDevices.fetchRetired';

export default class FM3DeviceCount extends LightningElement {
    @wire(fetchOnline) online;
    @wire(fetchOffline) offline;
    @wire(fetchRetired) retired;
}
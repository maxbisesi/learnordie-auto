import {By, until} from 'selenium-webdriver';
import { loginData } from '../loginData';
import logger from '../logger';
import TemplatePage from './TemplatePage';
import Validate from '../Validate';
import Utils from '../Utils';

export default class ChumTab extends TemplatePage {
    pageName = 'ChumTab';

    constructor(seleniumWebDriver) {
        super();
        this.driver = seleniumWebDriver;
        logger(`New ChumTab page`);
    }

    async validateField(field,value) {
        logger(`validatField on: ${this.pageName}. field: ${field}  value: ${value}`);
        switch(field) {
            case `Card`: 
                const valcard = await this.driver.wait(until.elementLocated(By.id('chumcard'), 3000));
                return await Validate(valcard,value);
            case `Answer`: 
                const valanswer = await this.driver.wait(until.elementLocated(By.id('chumanswer'), 3000));
                return await Validate(valanswer,value);
            case `Category`:
                const valcat = await this.driver.wait(until.elementLocated(By.id('chumcategory'), 3000));
                return await Validate(valcat,value,'value');
            case `Math Module`:
                try {
                    const mathmod = await this.driver.wait(until.elementLocated(By.id('mathmodule')), 1000);
                    return true;
                } catch(e) {
                    return false;
                }
            case `Equilateral Triangle Image`: 
                try {
                    const eq = await this.driver.wait(until.elementLocated(By.className('chum-questionImage-equilateral')), 1000);
                    return true;
                } catch(e) {
                    return false;
                }
            default: throw new Error(`${field} not defined in fillField() on ${this.pageName}`);
        }
    }

    async clickButton(buttonname) {
        logger(`clicking ${buttonname} on ${this.pageName} ...`);
        switch(buttonname) {
            case `Submit`:                 
                const chumsubmit = await this.driver.wait(until.elementLocated(By.id('chumsubmit'), 3000));
                await chumsubmit.click();
                return true;
            case `Equilateral Image`:
                const eqimg = await this.driver.wait(until.elementLocated(By.className('chum-questionImage-equilateral'), 3000));
                await eqimg.click();
                return true;
            case `Equilateral`:
                const eqbutton = await this.driver.wait(until.elementLocated(By.id('equilateral'), 3000));
                await eqbutton.click();
                return true;
            case `Shape Sub Module`: 
                const shapemod = await this.driver.wait(until.elementLocated(By.id('shapesubmod'), 3000));
                await shapemod.click();
                return true;
            case `Math Sub Module`: 
                const picon = await this.driver.wait(until.elementLocated(By.id('mathsubmod'), 3000));
                await picon.click();
                return true;
            default: throw new Error(`clickButton: ${buttonname} not defined on ${this.pageName} ... `);
        } 
    }

    async fillField(field,value) {
        logger(`filling field: ${field} with value: ${value}`);
        switch(field) {
            case `Card`: 
                const card = await this.driver.wait(until.elementLocated(By.id('chumcard'), 3000));
                await card.sendKeys(value);
                return true;
            case `Answer`: 
                const answer = await this.driver.wait(until.elementLocated(By.id('chumanswer'), 3000));
                await answer.sendKeys(value);
                return true;
            case `Category`:
                const cat = await this.driver.wait(until.elementLocated(By.id('chumcategory'), 3000));
                await cat.sendKeys(value);
                return true;
            default: throw new Error(`${field} not defined in fillField() on ${this.pageName}`);
        }
    }
    
    async clickUnicodeButton(key,val) {
        const unicodeCharacters = ['⁰','¹','²','³','⁴','⁵','⁶','⁷','⁸','⁹','¼','½','¾','₀','₁','₂','₃','₄','₅','₆','₇','₈','₉','∞','π'];
        const unicodeButtons = await this.driver.wait(until.elementsLocated(By.className('unicode-button')));
        let focusedElement;
        // Focus on element first 
        switch(key) {
            case `Card`: 
                focusedElement = await this.driver.wait(until.elementLocated(By.id('chumcard'), 3000));
                focusedElement.click();
                break;
            case `Answer`: 
                focusedElement = this.driver.wait(until.elementLocated(By.id('chumanswer'), 3000));
                focusedElement.click();
                break;
            case `Category`:
                focusedElement = this.driver.wait(until.elementLocated(By.id('chumcategory'), 3000));
                focusedElement.click();
                break;
            default: throw new Error(`${key} not defined in clickUnicodeButton(key,val) on ${this.pageName}`);
        }

        if(val.startsWith('randomUnicode:')) {
            const tokens = val.split(':');
            const valind = tokens[1];
            let vallength;
            if ( tokens[2] !== undefined ) {
              vallength = tokens[2];
            }
            let randomUnicode = '';


            if (Utils.randomData.randomUnicodes[valind] === undefined) {
                // IF this is undefined, then that randomData point isn't yet created,
                // create it, stick it in there and return it.
                // Unicode characters haven't been clicked and saved yet, so do that then hold on to the value:
                logger(`Clicking ${vallength} unicode characters.`);
                for(let ranuni = 0; ranuni < vallength; ++ranuni) {
                let rand = Math.floor(Math.random()*unicodeButtons.length);
                    await unicodeButtons[rand].click();
                    randomUnicode += await unicodeButtons[rand].getAttribute('value');
                }
                logger(`randomUnicode: ${randomUnicode}`);
                Utils.randomData.randomUnicodes[valind] = randomUnicode;
            } else {
                // There's already a Unicode value stored, use that one. There can only be one
                focusedElement.sendKeys(Utils.randomData.randomUnicodes[valind]);
            }
            return true;
        }
        logger(`Fail unknown val in clickUnicodeButton() on ChumTab`);
        return false;
    }

}
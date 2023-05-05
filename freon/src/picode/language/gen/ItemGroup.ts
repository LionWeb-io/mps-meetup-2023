// Generated by the Freon Language Generator.
import { observable } from "mobx";
import {
    MobxModelElementImpl,
    observableprim,
    observablepartlist,
    FreNamedNode,
    FreUtils,
    FreParseLocation,
    matchElementList,
    matchPrimitiveList,
    matchReferenceList
} from "@freon4dsl/core";
import { INamedConcept, SimpleItem, SimpleformsMetaType } from "./internal";

/**
 * Class ItemGroup is the implementation of the concept with the same name in the language definition file.
 * It uses mobx decorators to enable parts of the language environment, e.g. the editor, to react
 * to changes in the state of its properties.
 */
export class ItemGroup extends MobxModelElementImpl implements FreNamedNode, INamedConcept {
    /**
     * A convenience method that creates an instance of this class
     * based on the properties defined in 'data'.
     * @param data
     */
    static create(data: Partial<ItemGroup>): ItemGroup {
        const result = new ItemGroup();
        if (!!data.name) {
            result.name = data.name;
        }
        if (!!data.items) {
            data.items.forEach(x => result.items.push(x));
        }
        if (!!data.parse_location) {
            result.parse_location = data.parse_location;
        }
        return result;
    }

    readonly $typename: SimpleformsMetaType = "ItemGroup"; // holds the metatype in the form of a string
    $id: string; // a unique identifier
    parse_location: FreParseLocation; // if relevant, the location of this element within the source from which it is parsed
    name: string; // implementation of name
    items: SimpleItem[]; // implementation of part 'items'

    constructor(id?: string) {
        super();
        if (!!id) {
            this.$id = id;
        } else {
            this.$id = FreUtils.ID(); // uuid.v4();
        }
        // Both 'observableprim' and 'observableprimlist' change the get and set of the attribute
        // such that the part is observable. In lists no 'null' or 'undefined' values are allowed.
        observableprim(this, "name");
        this.name = "";

        // Both 'observablepart' and 'observablepartlist' change the get and set of the attribute
        // such that the parent-part relationship is consistently maintained,
        // and make sure the part is observable. In lists no 'null' or 'undefined' values are allowed.
        observablepartlist(this, "items");
    }

    /**
     * Returns the metatype of this instance in the form of a string.
     */
    freLanguageConcept(): SimpleformsMetaType {
        return this.$typename;
    }

    /**
     * Returns the unique identifier of this instance.
     */
    freId(): string {
        return this.$id;
    }

    /**
     * Returns true if this instance is a model concept.
     */
    freIsModel(): boolean {
        return false;
    }

    /**
     * Returns true if this instance is a model unit.
     */
    freIsUnit(): boolean {
        return false;
    }

    /**
     * Returns true if this instance is an expression concept.
     */
    freIsExpression(): boolean {
        return false;
    }

    /**
     * Returns true if this instance is a binary expression concept.
     */
    freIsBinaryExpression(): boolean {
        return false;
    }
    /**
     * A convenience method that copies this instance into a new object.
     */
    copy(): ItemGroup {
        const result = new ItemGroup();
        if (!!this.name) {
            result.name = this.name;
        }
        if (!!this.items) {
            this.items.forEach(x => result.items.push(x.copy()));
        }
        return result;
    }
    /**
     * Matches a partial instance of this class to this object
     * based on the properties defined in the partial.
     * @param toBeMatched
     */
    public match(toBeMatched: Partial<ItemGroup>): boolean {
        let result: boolean = true;
        if (result && toBeMatched.name !== null && toBeMatched.name !== undefined && toBeMatched.name.length > 0) {
            result = result && this.name === toBeMatched.name;
        }
        if (result && !!toBeMatched.items) {
            result = result && matchElementList(this.items, toBeMatched.items);
        }
        return result;
    }
}

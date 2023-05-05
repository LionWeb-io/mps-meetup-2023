// Generated by the Freon Language Generator.
import {
    MobxModelElementImpl,
    FreNode,
    FreUtils,
    FreParseLocation,
    matchElementList,
    matchPrimitiveList,
    matchReferenceList
} from "@freon4dsl/core";
import { SimpleformsMetaType } from "./internal";

/**
 * Class Type is the implementation of the concept with the same name in the language definition file.
 * It uses mobx decorators to enable parts of the language environment, e.g. the editor, to react
 * to changes in the state of its properties.
 */
export abstract class Type extends MobxModelElementImpl implements FreNode {
    readonly $typename: SimpleformsMetaType = "Type"; // holds the metatype in the form of a string
    $id: string; // a unique identifier
    parse_location: FreParseLocation; // if relevant, the location of this element within the source from which it is parsed

    constructor(id?: string) {
        super();
        if (!!id) {
            this.$id = id;
        } else {
            this.$id = FreUtils.ID(); // uuid.v4();
        }
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
    copy(): Type {
        console.log("Type: copy method should be implemented by concrete subclass");
        return null;
    }
    /**
     * Matches a partial instance of this class to this object
     * based on the properties defined in the partial.
     * @param toBeMatched
     */
    public match(toBeMatched: Partial<Type>): boolean {
        let result: boolean = true;

        return result;
    }
}

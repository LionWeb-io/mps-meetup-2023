// Generated by the Freon Language Generator.
import { Form, IntType, ItemGroup, MainModel, SimpleItem, StringType, Type } from "../../language/gen";
import { SimpleformsWorker } from "./SimpleformsWorker";

/**
 * Class SimpleformsDefaultWorker is part of the implementation of the visitor pattern on models.
 * It implements the interface SimpleformsWorker with empty methods, and can thus be used as
 * base to any class that needs to traverse the model tree.
 * Class SimpleformsWalker implements the traversal of the model tree. This class implements
 * the actual visiting of each node in the tree.
 */
export class SimpleformsDefaultWorker implements SimpleformsWorker {
    /**
     * Visits 'modelelement' before visiting its children.
     * @param modelelement
     */
    public execBeforeMainModel(modelelement: MainModel): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' after visiting its children.
     * @param modelelement
     */
    public execAfterMainModel(modelelement: MainModel): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' before visiting its children.
     * @param modelelement
     */
    public execBeforeForm(modelelement: Form): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' after visiting its children.
     * @param modelelement
     */
    public execAfterForm(modelelement: Form): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' before visiting its children.
     * @param modelelement
     */
    public execBeforeItemGroup(modelelement: ItemGroup): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' after visiting its children.
     * @param modelelement
     */
    public execAfterItemGroup(modelelement: ItemGroup): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' before visiting its children.
     * @param modelelement
     */
    public execBeforeSimpleItem(modelelement: SimpleItem): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' after visiting its children.
     * @param modelelement
     */
    public execAfterSimpleItem(modelelement: SimpleItem): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' before visiting its children.
     * @param modelelement
     */
    public execBeforeType(modelelement: Type): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' after visiting its children.
     * @param modelelement
     */
    public execAfterType(modelelement: Type): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' before visiting its children.
     * @param modelelement
     */
    public execBeforeStringType(modelelement: StringType): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' after visiting its children.
     * @param modelelement
     */
    public execAfterStringType(modelelement: StringType): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' before visiting its children.
     * @param modelelement
     */
    public execBeforeIntType(modelelement: IntType): boolean {
        return false;
    }

    /**
     * Visits 'modelelement' after visiting its children.
     * @param modelelement
     */
    public execAfterIntType(modelelement: IntType): boolean {
        return false;
    }
}
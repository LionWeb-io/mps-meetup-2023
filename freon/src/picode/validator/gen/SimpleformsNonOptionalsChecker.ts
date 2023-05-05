// Generated by the Freon Language Generator.
import { FreError, FreErrorSeverity, FreWriter, FreLanguageEnvironment } from "@freon4dsl/core";
import { Form, ItemGroup, SimpleItem, Type, StringType, IntType, INamedConcept, MainModel } from "../../language/gen";
import { SimpleformsDefaultWorker } from "../../utils/gen";
import { SimpleformsCheckerInterface } from "./SimpleformsValidator";

/**
 * Class SimpleformsNonOptionalsChecker is part of the implementation of the default validator.
 * It checks whether non-optional properties, as such defined in the .ast definition, indeed
 * have a value.
 * Class SimpleformsWalker implements the traversal of the model tree. This class implements
 * the actual checking of each node in the tree.
 */
export class SimpleformsNonOptionalsChecker extends SimpleformsDefaultWorker implements SimpleformsCheckerInterface {
    // 'myWriter' is used to provide error messages on the nodes in the model tree
    myWriter: FreWriter = FreLanguageEnvironment.getInstance().writer;
    // 'errorList' holds the errors found while traversing the model tree
    errorList: FreError[] = [];

    /**
     * Checks 'modelelement' before checking its children.
     * Found errors are pushed onto 'errorlist'.
     * If an error is found, it is considered 'fatal', which means that no other checks on
     * 'modelelement' are performed.
     *
     * @param modelelement
     */
    public execBeforeMainModel(modelelement: MainModel): boolean {
        let hasFatalError: boolean = false;
        if (modelelement.name === null || modelelement.name === undefined || modelelement.name?.length == 0) {
            hasFatalError = true;
            this.errorList.push(
                new FreError("Property 'name' must have a value", modelelement, modelelement.name, "name", FreErrorSeverity.Error)
            );
        }

        return hasFatalError;
    }

    /**
     * Checks 'modelelement' before checking its children.
     * Found errors are pushed onto 'errorlist'.
     * If an error is found, it is considered 'fatal', which means that no other checks on
     * 'modelelement' are performed.
     *
     * @param modelelement
     */
    public execBeforeForm(modelelement: Form): boolean {
        let hasFatalError: boolean = false;
        if (modelelement.name === null || modelelement.name === undefined || modelelement.name?.length == 0) {
            hasFatalError = true;
            this.errorList.push(
                new FreError("Property 'name' must have a value", modelelement, modelelement.name, "name", FreErrorSeverity.Error)
            );
        }

        return hasFatalError;
    }

    /**
     * Checks 'modelelement' before checking its children.
     * Found errors are pushed onto 'errorlist'.
     * If an error is found, it is considered 'fatal', which means that no other checks on
     * 'modelelement' are performed.
     *
     * @param modelelement
     */
    public execBeforeItemGroup(modelelement: ItemGroup): boolean {
        let hasFatalError: boolean = false;
        if (modelelement.name === null || modelelement.name === undefined || modelelement.name?.length == 0) {
            hasFatalError = true;
            this.errorList.push(
                new FreError("Property 'name' must have a value", modelelement, modelelement.name, "name", FreErrorSeverity.Error)
            );
        }

        return hasFatalError;
    }

    /**
     * Checks 'modelelement' before checking its children.
     * Found errors are pushed onto 'errorlist'.
     * If an error is found, it is considered 'fatal', which means that no other checks on
     * 'modelelement' are performed.
     *
     * @param modelelement
     */
    public execBeforeSimpleItem(modelelement: SimpleItem): boolean {
        let hasFatalError: boolean = false;
        if (modelelement.name === null || modelelement.name === undefined || modelelement.name?.length == 0) {
            hasFatalError = true;
            this.errorList.push(
                new FreError("Property 'name' must have a value", modelelement, modelelement.name, "name", FreErrorSeverity.Error)
            );
        }
        if (modelelement.type === null || modelelement.type === undefined) {
            hasFatalError = true;
            this.errorList.push(
                new FreError("Property 'type' must have a value", modelelement, modelelement.name, "type", FreErrorSeverity.Error)
            );
        }

        return hasFatalError;
    }
}
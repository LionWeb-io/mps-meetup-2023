// Generated by the Freon Language Generator.
import { FreError, FreErrorSeverity, FreWriter, FreNodeReference, FreNamedNode, FreLanguageEnvironment } from "@freon4dsl/core";
import { SimpleformsEveryConcept } from "../../language/gen";
import { SimpleformsDefaultWorker } from "../../utils/gen";
import { SimpleformsCheckerInterface } from "./SimpleformsValidator";

/**
 * Class SimpleformsReferenceChecker is part of the implementation of the default validator.
 * It checks whether references can be found within the model.
 *
 * Class SimpleformsWalker implements the traversal of the model tree. This class implements
 * the actual checking of each node in the tree.
 */
export class SimpleformsReferenceChecker extends SimpleformsDefaultWorker implements SimpleformsCheckerInterface {
    // 'myWriter' is used to provide error messages on the nodes in the model tree
    myWriter: FreWriter = FreLanguageEnvironment.getInstance().writer;
    // 'errorList' holds the errors found while traversing the model tree
    errorList: FreError[] = [];
    private refSeparator: string = "/";

    private makeErrorMessage(
        modelelement: SimpleformsEveryConcept,
        referredElem: FreNodeReference<FreNamedNode>,
        propertyName: string,
        locationDescription: string
    ) {
        const scoper = FreLanguageEnvironment.getInstance().scoper;
        const possibles = scoper.getVisibleElements(modelelement).filter(elem => elem.name === referredElem.name);
        if (possibles.length > 0) {
            this.errorList.push(
                new FreError(
                    `Reference '${referredElem.pathnameToString(this.refSeparator)}' should have type '${
                        referredElem.typeName
                    }', but found type(s) [${possibles.map(elem => `${elem.freLanguageConcept()}`).join(", ")}]`,
                    modelelement,
                    `${propertyName} of ${locationDescription}`,
                    `${propertyName}`,
                    FreErrorSeverity.Error
                )
            );
        } else {
            this.errorList.push(
                new FreError(
                    `Cannot find reference '${referredElem.pathnameToString(this.refSeparator)}'`,
                    modelelement,
                    `${propertyName} of ${locationDescription}`,
                    `${propertyName}`,
                    FreErrorSeverity.Error
                )
            );
        }
    }
}
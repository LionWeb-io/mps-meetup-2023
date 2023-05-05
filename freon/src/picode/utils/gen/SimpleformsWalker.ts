// Generated by the Freon Language Generator.
import { SimpleformsEveryConcept } from "../../language/gen";
import { IntType, StringType, Type, SimpleItem, ItemGroup, Form, MainModel } from "../../language/gen";
import { SimpleformsWorker } from "./SimpleformsWorker";
import { FreLogger } from "@freon4dsl/core";

const LOGGER = new FreLogger("SimpleformsWalker");

/**
 * Class SimpleformsWalker implements the extended visitor pattern of instances of language simpleforms.
 * This class implements the traversal of the model tree, classes that implement SimpleformsWorker
 * are responsible for the actual work being done on the nodes of the tree.
 * Every node is visited twice, once before the visit of its children, and once after this visit.
 *
 * With the use of the parameter 'includeChildren', which takes a function, a very fine-grained control can be taken
 * over which nodes are and are not visited.
 */
export class SimpleformsWalker {
    myWorkers: SimpleformsWorker[] = []; // the instances that do the actual work on each node of the tree

    /**
     * This method is the entry point of the traversal through the model tree. Each of the workers will be called in
     * the order in which they are present in the array 'myWorkers'. If, for a tree node, a worker returns 'false',
     * none of the rest of the workers will be called. For that particular node both the 'execBefore' and 'execAfter'
     * method of any of the other workers will be skipped.
     *
     * @param modelelement the top node of the part of the tree to be visited
     * @param includeChildren if true, the children of 'modelelement' will also be visited
     */
    public walk(modelelement: SimpleformsEveryConcept, includeChildren?: (elem: SimpleformsEveryConcept) => boolean) {
        if (this.myWorkers.length > 0) {
            if (modelelement instanceof IntType) {
                return this.walkIntType(modelelement, includeChildren);
            }
            if (modelelement instanceof StringType) {
                return this.walkStringType(modelelement, includeChildren);
            }
            if (modelelement instanceof Type) {
                return this.walkType(modelelement, includeChildren);
            }
            if (modelelement instanceof SimpleItem) {
                return this.walkSimpleItem(modelelement, includeChildren);
            }
            if (modelelement instanceof ItemGroup) {
                return this.walkItemGroup(modelelement, includeChildren);
            }
            if (modelelement instanceof Form) {
                return this.walkForm(modelelement, includeChildren);
            }
            if (modelelement instanceof MainModel) {
                return this.walkMainModel(modelelement, includeChildren);
            }
        } else {
            LOGGER.error("No worker found.");
        }
    }

    private walkIntType(modelelement: IntType, includeChildren?: (elem: SimpleformsEveryConcept) => boolean) {
        let stopWalkingThisNode: boolean = false;
        for (const worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execBeforeIntType(modelelement);
            }
        }

        for (let worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execAfterIntType(modelelement);
            }
        }
    }

    private walkStringType(modelelement: StringType, includeChildren?: (elem: SimpleformsEveryConcept) => boolean) {
        let stopWalkingThisNode: boolean = false;
        for (const worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execBeforeStringType(modelelement);
            }
        }

        for (let worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execAfterStringType(modelelement);
            }
        }
    }

    private walkType(modelelement: Type, includeChildren?: (elem: SimpleformsEveryConcept) => boolean) {
        let stopWalkingThisNode: boolean = false;
        for (const worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execBeforeType(modelelement);
            }
        }

        for (let worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execAfterType(modelelement);
            }
        }
    }

    private walkSimpleItem(modelelement: SimpleItem, includeChildren?: (elem: SimpleformsEveryConcept) => boolean) {
        let stopWalkingThisNode: boolean = false;
        for (const worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execBeforeSimpleItem(modelelement);
            }
        }
        // work on children in the model tree
        if (!(includeChildren === undefined) && includeChildren(modelelement.type)) {
            this.walk(modelelement.type, includeChildren);
        }

        for (let worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execAfterSimpleItem(modelelement);
            }
        }
    }

    private walkItemGroup(modelelement: ItemGroup, includeChildren?: (elem: SimpleformsEveryConcept) => boolean) {
        let stopWalkingThisNode: boolean = false;
        for (const worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execBeforeItemGroup(modelelement);
            }
        }
        // work on children in the model tree
        modelelement.items.forEach(p => {
            if (!(includeChildren === undefined) && includeChildren(p)) {
                this.walk(p, includeChildren);
            }
        });

        for (let worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execAfterItemGroup(modelelement);
            }
        }
    }

    private walkForm(modelelement: Form, includeChildren?: (elem: SimpleformsEveryConcept) => boolean) {
        let stopWalkingThisNode: boolean = false;
        for (const worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execBeforeForm(modelelement);
            }
        }
        // work on children in the model tree
        modelelement.groups.forEach(p => {
            if (!(includeChildren === undefined) && includeChildren(p)) {
                this.walk(p, includeChildren);
            }
        });

        for (let worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execAfterForm(modelelement);
            }
        }
    }

    private walkMainModel(modelelement: MainModel, includeChildren?: (elem: SimpleformsEveryConcept) => boolean) {
        let stopWalkingThisNode: boolean = false;
        for (const worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execBeforeMainModel(modelelement);
            }
        }
        // work on children in the model tree
        modelelement.forms.forEach(p => {
            if (!(includeChildren === undefined) && includeChildren(p)) {
                this.walk(p, includeChildren);
            }
        });

        for (let worker of this.myWorkers) {
            if (!stopWalkingThisNode) {
                stopWalkingThisNode = worker.execAfterMainModel(modelelement);
            }
        }
    }
}

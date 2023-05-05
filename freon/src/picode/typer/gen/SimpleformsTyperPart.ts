// Generated by the Freon Language Generator.
import { FreNode, FreType, FreTyper, FreCompositeTyper } from "@freon4dsl/core";

export class SimpleformsTyperPart implements FreTyper {
    mainTyper: FreCompositeTyper;

    /**
     * Returns true if 'modelelement' is marked as 'type' in the Typer definition.
     * @param modelelement
     */
    public isType(modelelement: FreNode): boolean | null {
        return false;
    }

    /**
     * Returns the type of 'modelelement' according to the type rules in the Typer Definition.
     * @param modelelement
     */
    public inferType(modelelement: FreNode): FreType | null {
        return null;
    }

    /**
     * Returns true if type1 equals type2.
     * This is a strict equal.
     * @param type1
     * @param type2
     */
    public equals(type1: FreType, type2: FreType): boolean | null {
        return false;
    }

    /**
     * Returns true if type1 conforms to type2. The direction is type1 conforms to type2.
     * @param type1
     * @param type2
     */
    public conforms(type1: FreType, type2: FreType): boolean | null {
        return false;
    }

    /**
     * Returns true if all types in typelist1 conform to the types in typelist2, in the given order.
     * @param typelist1
     * @param typelist2
     */
    public conformsList(typelist1: FreType[], typelist2: FreType[]): boolean | null {
        return false;
    }

    /**
     * Returns the common super type of all types in typelist
     * @param typelist
     */
    public commonSuper(typelist: FreType[]): FreType | null {
        return null;
    }

    /**
     * Returns all super types as defined in the typer definition.
     * @param type
     */
    public getSuperTypes(type: FreType): FreType[] | null {
        return [];
    }
}
import {FreNode} from "@freon4dsl/core";
import {FreLanguage} from "@freon4dsl/core";
import {decode, encode} from "universal-base64url"

type LionWebNode = object

export class Freon2LionWebConverter {
    public toFreon(lwNode: LionWebNode): FreNode {
        throw new Error("Not implemented")
    }

    public toLionWeb(freNode: FreNode): LionWebNode[] {
        const idMap = new Map<string, LionWebNode>()
        this.convertToLionWeb(freNode, idMap)
        console.log("idMap", idMap)
        return Array.from(idMap.values())
    }

    private convertToLionWeb(freNode: FreNode, idMap: Map<string, LionWebNode>): void {
        if(idMap.has(freNode.freId())) {
            console.log("already found", freNode.freId())
            return;
        }

        let toTraverse: FreNode[] = []

        let conceptName = freNode.freLanguageConcept()
        let concept = FreLanguage.getInstance().classifier(conceptName)

        let properties = {}
        let children = {}
        let references = {}
        for (let prop of concept.properties) {
            let [k, property] = prop
            switch (property.propertyKind) {
                case "primitive":
                    properties[property.name] = freNode[property.name]
                    break
                case "part":
                    if (children[property.name] === undefined) {
                        children[property.name] = []
                    }
                    if (property.isList) {
                        let freParts = freNode[property.name] as FreNode[];
                        for(const part of freParts) {
                            if (part !== undefined && part !== null) {
                                console.log("FRE NODE IS " + part?.constructor?.name)
                                children[property.name].push(this.toModelixId(part.freId()))
                                toTraverse.push(part)
                            }
                        }
                    } else {
                        let child = freNode[property.name] as FreNode;
                        if (child !== undefined && child !== null) {
                            console.log("FRE NODE IS " + child?.constructor?.name)
                            children[property.name].push(this.toModelixId(child.freId()))
                            toTraverse.push(child)
                        }
                    }
                    break
                case "reference":
                    if (references[property.name] === undefined) {
                        references[property.name] = []
                    }
                    if (property.isList) {
                        let freReferences = freNode[property.name] as FreNode[];
                        for(const freRef of freReferences) {
                            if (freRef !== undefined && freRef !== null) {
                                references[property.name].push({
                                    nodeInfo: null,
                                    reference: this.toModelixId(freRef.freId())
                                })
                            }
                        }
                    } else {
                        let refTarget = freNode[property.name] as FreNode;
                        if (refTarget !== undefined && refTarget !== null) {
                            references[property.name].push({
                                nodeInfo: null,
                                reference: this.toModelixId(refTarget.freId())
                            })
                        }
                    }
                    break
            }
        }

        let result = {
            // TODO Why change the id?
            // id: this.toModelixId(freNode.freId()),
            id: freNode.freId(),
            // TODO Why encode this, already is the encoded value that was in the input.
            concept: concept.id,
            parent: freNode.freOwner().freId(),
            properties: properties,
            children: children,
            references: references
        } as LionWebNode

        idMap.set(freNode.freId(), result)

        for (let next of toTraverse) {
            this.convertToLionWeb(next, idMap)
        }
    }

    private toModelixId(freId: string): string {
        return freId;
        // let result = 0
        //
        // const chars = [...freId];
        //
        // chars.forEach((c, i) => result += c.codePointAt(0));
        //
        // return result.toString()
    }
}

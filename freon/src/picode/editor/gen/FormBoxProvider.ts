// Generated by the Freon Language Generator.
import { Box, BoxUtil, BoxFactory, FreNode, FreBoxProvider, FreProjectionHandler, FreLanguage } from "@freon4dsl/core";

import { Form } from "../../language/gen";

/**
 * This class implements the box provider for a single node of type Form.
 * The box provider is able to create the (tree of) boxes for the node, based
 * on the projections that are currently selected by the user.
 * The top of the tree of boxes is always a box of type ElementBox, which is
 * a box that will never be rendered itself, only its content will. Thus, we
 * have a stable entry in the complete box tree for every FreNode node.
 */
export class FormBoxProvider extends FreBoxProvider {
    constructor(mainHandler: FreProjectionHandler) {
        super(mainHandler);
        this.knownBoxProjections = ["default"];
        this.knownTableProjections = ["default"];
        this.conceptName = "Form";
    }

    protected getContent(projectionName: string): Box {
        // console.log("GET CONTENT " + this._element?.freId() + ' ' +  this._element?.freLanguageConcept() + ' ' + projectionName);
        // see if we need to use a custom projection
        if (!this.knownBoxProjections.includes(projectionName) && !this.knownTableProjections.includes(projectionName)) {
            let BOX: Box = this.mainHandler.executeCustomProjection(this._element, projectionName);
            if (!!BOX) {
                // found one, so return it
                return BOX;
            }
        } else {
            // select the box to return based on the projectionName
            if (projectionName === "default") {
                return this.getDefault();
            }
        }
        // in all other cases, return the default
        return this.getDefault();
    }

    private getDefault(): Box {
        return BoxFactory.verticalLayout(this._element as Form, "Form-overall", "", [
            BoxFactory.horizontalLayout(
                this._element as Form,
                "Form-hlist-line-0",
                "",
                [BoxUtil.labelBox(this._element as Form, "Form", "top-1-line-0-item-0"), BoxUtil.textBox(this._element as Form, "name")],
                { selectable: false }
            ),
            BoxUtil.emptyLineBox(this._element as Form, "Form-empty-line-1"),
            BoxUtil.verticalPartListBox(this._element as Form, (this._element as Form).groups, "groups", null, this.mainHandler)
        ]);
    }
}

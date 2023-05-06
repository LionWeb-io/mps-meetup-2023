import type {FreEnvironment} from "@freon4dsl/core";
import {FreUtils} from "@freon4dsl/core";
import {LanguageInitializer} from "../language/LanguageInitializer";
import type {IServerCommunication} from "../server/IServerCommunication";
import {LionwebIdProvider} from "../server/LionwebIdProvider";
import {LionWebCommunication} from "../server/LionWebCommunication";
import {PropertiesEnvironment} from "../../picode/config/gen/PropertiesEnvironment";


/**
 * The one and only reference to the actual language for which this editor runs
 */
export const editorEnvironment: FreEnvironment = PropertiesEnvironment.getInstance();
LanguageInitializer.initialize();

/**
 * The one and only reference to the server on which the models are stored
 */
export const serverCommunication: IServerCommunication = LionWebCommunication.getInstance();
export const idProvider = new LionwebIdProvider();
FreUtils.nodeIdProvider = idProvider;


// export const serverCommunication: IServerCommunication = ServerCommunication.getInstance();
// export const serverCommunication: IServerCommunication = MpsServerCommunication.getInstance();

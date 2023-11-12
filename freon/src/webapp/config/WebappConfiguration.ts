import type { FreEnvironment, IServerCommunication } from "@freon4dsl/core";
import { PROPSEnvironment } from "../../picode/config/gen/PROPSEnvironment";
import { LanguageInitializer } from "../language/LanguageInitializer";
import { FreUtils, LionWebCommunication, LionwebIdProvider, LocalLionwebIdProvider, ServerCommunication } from "@freon4dsl/core";

/**
 * The one and only reference to the server on which the models are stored
 */
// export const serverCommunication: IServerCommunication = ServerCommunication.getInstance();
export const serverCommunication: IServerCommunication = LionWebCommunication.getInstance();
/**
 * The one and only reference to the actual language for which this editor runs
 */
export const editorEnvironment: FreEnvironment = PROPSEnvironment.getInstance();
LanguageInitializer.initialize();

export const idProvider = new LocalLionwebIdProvider();
FreUtils.nodeIdProvider = idProvider;

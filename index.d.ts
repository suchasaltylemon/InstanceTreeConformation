/**
 * Small library for verifying an instance's descendants are of a valid type
 * @version 1.0
 */

/**
 * Type representing an instance's descendants
 */
export type InstanceNameTree = {
  [name: string]: keyof Instances | [keyof Instances, InstanceNameTree];
};

type InstanceTree<T extends InstanceNameTree> = {
  [name in keyof T]: T[name] extends keyof Instances
    ? Instances[T[name]]
    : T[name] extends [keyof Instances, InstanceNameTree]
      ? Instances[T[name][0]] & InstanceTree<T[name][1]>
      : never;
};

/**
 * Function which returns whether an instance's descendants are of the correct type
 */
export declare function InstanceTreeConformsToShape<T extends Instance, P extends InstanceNameTree>(
  instance: T,
  shape: P,
): instance is T & InstanceTree<P>


export default InstanceTreeConformsToShape

/** @type {import('@remix-run/dev').AppConfig} */
module.exports = {
  ignoredRouteFiles: ["**/.*"],
  // appDirectory: "app",
  // assetsBuildDirectory: "public/build",
  // serverBuildPath: "build/index.js",
  publicPath: "/admin/build/",
  future: {
    unstable_tailwind: true,
  },
  serverDependenciesToBundle: ["axios"],
};

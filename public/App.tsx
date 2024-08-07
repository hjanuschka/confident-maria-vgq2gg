import * as React from "react";
import ZqProvider from "zq-ui-v3/ZqProvider";
import { Router } from "react-router-dom";
// import menus from "./routes/menus";
import { createBrowserHistory } from "history";
import Routes from "./routes";
import MenuIcon from "@material-ui/icons/Menu";
import { SvgIconProps } from "@material-ui/core/SvgIcon/SvgIcon";
import { callApiByPath, setupAxios } from "./api/axios";
import ZqAdminProvider from "zq-ui-admin/ZqAdminProvider";
import Login from "./pages/Login";
import cookie from "react-cookies";
import uuid from "uuid";
import { getAllInfo } from "./utils/device";
import { useDispatch, useSelector } from "react-redux";
import { updateProfile } from "./redux/actions";
import MainLayout from "./layout/MainLayout";
import { delay, isNull } from "zq-ui-v3/utils/utils";
import { inWhiteList } from "./routes/whiteList";
import Callback from "./pages/oauth/Callback";

export const history = createBrowserHistory();

const iconMap: {
  [key: string]: React.FC<SvgIconProps>;
} = { list: MenuIcon };
const App: React.FC = () => {
  const [openLogin, setOpenLogin] = React.useState<boolean>(false);
  const dispatch = useDispatch();
  const menus = useSelector((state: any) => state.profile?.menuTree);

  const data = useSelector((state: any) => state.websocket);
  const { status, type, content } = data || {};
  console.log(status, type, content);

  setupAxios(history, setOpenLogin);
  React.useEffect(() => {
    (async () => {
      try {
        let deviceId = localStorage.getItem("deviceId");
        if (!deviceId) {
          deviceId = cookie.load("deviceId");
        }
        if (!deviceId) {
          deviceId = uuid.v1();
          const re: any = await callApiByPath("post", "/common/Device/save", {
            _id: deviceId,
            ...getAllInfo(window.navigator.userAgent),
          });
          localStorage.setItem("deviceId", re._id);
          cookie.save("deviceId", re._id);
        }
        window.onerror = async function (msg, url, line, col, error, ...others) {
          // 直接将错误打印到控制台
          if (isNull(error) && line === 0 && col === 0) return;
          console.log(msg, url, line, col, error?.stack, ...others);
          // 方便在未打开控制台的时候，记录错误对象
          try {
            await callApiByPath("post", "/common/JsError/save", {
              _id: uuid.v1(),
              deviceId,
              msg,
              url,
              line,
              col,
              error: error?.stack,
              others,
            });
          } catch (e) {
            console.log(e);
          }
        };
        if (!inWhiteList(history.location.pathname)) {
          const profile = await callApiByPath("get", "/account/User/myInfo");
          dispatch(updateProfile(profile));
          // dispatch(socketClose());
          // dispatch(socketConnect());
        }
      } catch (e) {
        console.error(e);
      }
      await delay(600);
      document.getElementById("loading").style.opacity = "0";
      await delay(800);
      document.getElementById("loading").style.display = "none";
      // websocket 链接
    })();
    return () => {};
  }, []);

  const isCallbackPage = history.location.pathname.startsWith("/oauth/Callback");
  return (
    <ZqAdminProvider openLogin={openLogin} setOpenLogin={setOpenLogin}>
      <Login
        {...{
          open: openLogin,
          onClose: () => setOpenLogin(false),
          isDialog: true,
          dialogProps: { open: openLogin, hideCloseBtn: true, hideFullBtn: true },
        }}
      />

      <ZqProvider name="后台管理" iconMap={iconMap} menuList={menus}>
        {isCallbackPage && <Callback history={history} />}
        {!isCallbackPage && menus?.length > 0 && (
          <MainLayout history={history}>
            <Router history={history}>
              <Routes />
            </Router>
          </MainLayout>
        )}
      </ZqProvider>
    </ZqAdminProvider>
  );
};
export default App;

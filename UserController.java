/*
(1)「新規ユーザー登録」フォーム画面を表示する。
(2)フォームにつけたアノテーションで入力チェックをするために、フォームの引数に org.springframework.validation.annotation.Validatedを付ける。
(3)(2)のチェック結果を格納するorg.springframework.validation.BindingResultを、引数に加える。
　このBindingResultは、フォームの直後に記述する必要がある。
　直後に指定されていない場合は、検証後に結果をバインドできず、org.springframework.validation.BindExceptionがスローされる。
(4)(2)のチェック結果は、BindingResult.hasErrors()メソッドで判定できる。
　hasErrors()の結果がtrueの場合は、入力値に問題があるため、フォーム表示画面に戻す。
(5)入力内容確認画面から新規作成処理にリクエストを送る際にも、入力チェックを必ず再実行すること。
　途中でデータを改ざんすることは可能であるため、必ず業務処理の直前で入力チェックは必要である。
(6)「ユーザー登録」フォーム初期表示時に、一件の住所フォームを表示させるために、フォームオブジェクトを編集する。
*/
package com.example.sample.app.validation;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user")
public class UserController {

  @ModelAttribute
    public UserForm setupForm() {
        UserForm form = new UserForm();
        List<AddressForm> addresses = new ArrayList<AddressForm>();
        addresses.add(new AddressForm());
        form.setAddresses(addresses); // (6)
        return form;
    }

  @RequestMapping(value = "create", method = RequestMethod.GET, params = "form")
  public String createForm() {
    return "user/createForm"; // (1)
  }

  @RequestMapping(value = "create", method = RequestMethod.POST, params = "confirm")
  public String createConfirm(@Validated /* (2) */ UserForm form, BindingResult /* (3) */ result) {
    if (result.hasErrors()) { // (4)
      return "user/createForm";
    }
    return "user/createConfirm";
  }

  @RequestMapping(value = "create", method = RequestMethod.POST)
  public String create(@Validated UserForm form, BindingResult result) { // (5)
    if (result.hasErrors()) {
      return "user/createForm";
    }
    // omitted business logic
    return "redirect:/user/create?complete";
  }

  @RequestMapping(value = "create", method = RequestMethod.GET, params = "complete")
  public String createComplete() {
    return "user/createComplete";
  }
}
